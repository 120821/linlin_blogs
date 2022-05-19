class Users::SessionsController < DeviseController
  prepend_before_action :require_no_authentication, only: [:new, :create]
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action(only: [:create, :destroy]) { request.env["devise.skip_timeout"] = true }

  # GET /resource/sign_in
  def new
    Rails.logger.info "--- hihihi , in new "
    self.resource = resource_class.new(sign_in_params)
    render layout: 'empty'
  end

  # POST /resource/sign_in
  def create
    user = Manager.where('email = ?', params[:user][:email]).first
    if user.blank?
      Rails.logger.info "-- case 1 用户名不存在"
      redirect_to root_path, alert: '用户名不存在。请立刻联系管理员。多次尝试失败会上报风控系统' and return
    end

    #if !user.is_otp_binded
    #  redirect_to '/users/sign_in', alert: '请先绑定谷歌验证码' and return
    #end

    #if user.is_otp_binded && user.get_otp_code != params[:user][:otp_code]
    #  Rails.logger.error "-- google otp not correct"
    #  redirect_to '/users/sign_in', alert: '您的google 验证码不正确' and return
    #end

    if user.blank? || !user.valid_password?(params[:user][:password])
      Rails.logger.info "-- case 2 邮箱与密码不匹配？"
      redirect_to root_path, alert: '邮箱与密码不匹配' and return
    end


    if user.valid_password? params[:user][:password]
      sign_in user
      user.last_sign_in_ip = user.current_sign_in_ip
      user.current_sign_in_ip = request.remote_ip
      user.save!
      redirect_to after_sign_in_path_for(user), alert: "登录成功"
    else
      Rails.logger.info "-- case 3 邮箱与密码不匹配？"
      redirect_to :back, alert: '邮箱与密码不匹配'
    end
  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    respond_to_on_destroy
  end

  protected

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  def translation_scope
    'devise.sessions'
  end

  private

  # Check if there is no signed in user before doing the sign out.
  #
  # If there is no signed in user, it will set the flash message and redirect
  # to the after_sign_out path.
  def verify_signed_out_user
    if all_signed_out?
      set_flash_message! :notice, :already_signed_out

      respond_to_on_destroy
    end
  end

  def all_signed_out?
    users = Devise.mappings.keys.map { |s| warden.user(scope: s, run_callbacks: false) }

    users.all?(&:blank?)
  end

  def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end
end

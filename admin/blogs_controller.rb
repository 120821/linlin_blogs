class AdminAdmin_BlogsController < ApplicationController
  before_action :set_admin_blog, only: [:show, :edit, :update, :destroy]

  skip_before_action :login
  # GET /admin_blogs
  # GET /admin_blogs.json
  def index
    @admin_blogs = Admin_Blog
    @total_count = Admin_Blog.all.size
    @admin_blogs = @admin_blogs.order('id desc').page(params[:page]).per(100)
    @admin_blogs = @admin_blogs.where('title like ?', "%#{params[:admin_blog_title]}%") if params[:admin_blog_title].present?
    @admin_blogs = @admin_blogs.where('content like ?', "%#{params[:admin_blog_content]}%") if params[:admin_blog_content].present?
  end

  # GET /admin_blogs/1
  # GET /admin_blogs/1.json
  def show
  end

  # GET /admin_blogs/new
  def new
    @admin_blog = Admin_Blog.new
  end

  # GET /admin_blogs/1/edit
  def edit
  end

  # POST /admin_blogs
  # POST /admin_blogs.json
  def create
    @admin_blog = Admin_Blog.new(admin_blog_params).where('username = admin', params[:currentuser])

    respond_to do |format|
      if @admin_blog.save
        format.html { redirect_to @admin_blog, notice: '操作成功' }
        format.json { render :show, status: :created, location: @admin_blog }
      else
        format.html { render :new }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_blogs/1
  # PATCH/PUT /admin_blogs/1.json
  def update
    respond_to do |format|
      if @admin_blog.update(admin_blog_params)
        format.html { redirect_to @admin_blog, notice: '操作成功' }
        format.json { render :show, status: :ok, location: @admin_blog }
      else
        format.html { render :edit }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_blogs/1
  # DELETE /admin_blogs/1.json
  def destroy
    @admin_blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url, notice: '操作成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_blog
      @admin_blog = Admin_Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_blog_params
      params.require(:admin_blog).permit(:title, :content)
    end
end


class LoginsController < ApplicationController
  skip_before_action :check_user_login

  def new
  end


  def create
    username_and_password_paris = {
      #使用=> 表示是字符串。使用：表示是symbol
      #{username:'linlin',password:'88888888'},
      #{username:'hihi', password: '888888'},
      #{username:'haha', password: '8888'}
      "linlin"=>"88888888",
      "hihi" => "888888",
      "haha"=> "8888",
    }
    is_user = username_and_password_paris[params[:username]] == params[:password]
    if is_user
      session[:current_user] = params[:username]
      redirect_to my_blogs_path # 跳转到 首页
    else
      redirect_to new_logins_path # 跳转到 登录页面
    end
  end

  def logout
    session[:current_user] = nil
    redirect_to my_blogs_path # 跳转到 首页
  end
  layout :false

end

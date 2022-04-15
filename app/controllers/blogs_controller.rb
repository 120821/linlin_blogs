class BlogsController < ApplicationController

  before_action :get_by_id,:only =>[:show,:destroy,:edit,:update]
  layout 'a'

  def index
    @blogs = Blog
    puts "--------------------hihih"
    @blogs = @blogs.where('name like ? ', "%#{params[:blog_title]}%") if params[:blog_title].present?
    @blogs = @blogs.where('address like ? ', "%#{params[:blog_content]}%") if params[:blog_content].present?
    @blogs = @blogs.page(params[:page]).per(30)
    render :layout => 'a'
    puts "-------end--index-----------hihih"
  end

  def new
    @blog = Blog.new
    @blog.title = params[:blog_title]
    @blog.time = params[:blog_time]
    @blog.content = params[:blog_content]
    @blog.save!
    render :layout => 'b'
  end

  def create
    puts("==params is: ")
    blog.create(  { :time => params[:time], :title=> params[:title], :content => params[:content] }  )
    redirect_to blogs_path
  end

  def edit
  end

  def update
    #@blog = Blog.find(params[:id])
    puts "=== in update, before : #{@blog.inspect}"
    @blog.title = params[:blog_title]
    @blog.time = params[:blog_time]
    @blog.content = params[:blog_content]
    @blog.save!
    puts "=== in update, after: #{@blog.inspect}"
    redirect_to blogs_path
    #redirect_to :back
  end

  def show
    puts "==== im show"
  end

  def destroy
    @blog.delete
    redirect_to blogs_path
  end

  private
  def get_by_id
    @blog = Blog.find(params[:id])
  end
end

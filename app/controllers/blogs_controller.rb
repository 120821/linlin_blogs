class BlogsController < ApplicationController

  before_action :get_by_id,:only =>[:show,:destroy,:edit,:update]

  def index
    @blogs = Blog
    puts "--------------------hihih"
    @blog = @blog.where('name like ? ', "%#{params[:blog_title]}%") if params[:blog_title].present?
    @blog = @blog.where('address like ? ', "%#{params[:blog_content]}%") if params[:blog_content].present?
   # @blog = @blog.page(params[:page]).per(30)

   # @total_count = @blog.all.size
    puts "-------end--index-----------hihih"
  end

  def new
    @blog = Blog.new
    @blog.title = params[:blog_title]
    @blog.time = params[:blog_time]
    @blog.content = params[:blog_content]
    @blog.save!

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

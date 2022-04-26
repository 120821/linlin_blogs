class BlogsController < ApplicationController
  before_action :get_by_id,:only =>[:show,:destroy,:edit,:update]

  def index
    @blog = Blog.all
    puts "--------------------hihih"
    @blog = @blog.where('title like ? ', "%#{params[:blog_title]}%") if params[:blog_title].present?
    @blog = @blog.where('content like ? ', "%#{params[:blog_content]}%") if params[:blog_content].present?

    @totul_count = @blogs.all.size
    @blogs = @blogs.page(params[:page]).per(30)
    puts "-------end--index-----------hihih"
  end

  def new
    @blog = Blog.new
    @blog.time = params[:time]
    @blog.content = params[:content]
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
    puts "=== in update, before : #{@blog.inspect}"
    @blog.title = params[:title]
    @blog.content = params[:content]
    @blog.save!
    puts "=== in update, after: #{@blog.inspect}"
    redirect_to blogs_path
  end

  def show
  end

  def destroy
    @blog.delete
    redirect_to blogs_path
  end

  private
  def get_by_id
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end

class BlogsController < ApplicationController

  before_action :get_by_id,:only =>[:show,:destroy,:edit,:update]
  layout 'a'

  def index
    @blogs = Blog.all
    render :layout => 'a'
  end

  def new
    @blog = Blog.new
    puts "=== in update, before : #{@blog.inspect}"
    @blog.title = params[:blog_title]
    @blog.time = params[:blog_time]
    @blog.save!
    puts "=== in update, after: #{@blog.inspect}"
    render :layout => 'b'
  end

  def create
    puts("==params is: ")
    #Blog.create :time => params[:time], :title=> params[:title]
    Blog.create(  { :time => params[:time], :title=> params[:title], :content => params[:content] }  )
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

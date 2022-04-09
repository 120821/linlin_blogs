class GoodsController < ApplicationController

  before_action :get_by_id,:only =>[:show,:destroy,:edit,:update]
  layout 'a'
  def index
    @goods = Good.all
    render :layout => 'a'
  end

  def new
    @good = Good.new
    render :layout => 'b'
  end

  def create
    puts "==params is: "
    Good.create :name => params[:name],
    :price => params[:price]
    redirect_to goods_path
  end

  def edit
  end

  def update
    #@goods.name = params[:name]
    #@goods.price = params[:price]
    #@goods.save

    @good.update params[:good]

    redirect_to goods_path

    #redirect_to :back
  end

  def show
  end

  def destroy
    @good.delete
    redirect_to goods_path
  end

  private
  def get_by_id
    @good = Good.find params[:id]
  end
end

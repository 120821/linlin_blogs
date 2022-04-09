class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.string :price
      t.timestamps
    end
    def all_goods
      all_goods = Good.all.map do |good|
        {
          :id = good.id
          :name = good.name
        }
      end
      render :json => {:result => all_goods}
    end
  end
end

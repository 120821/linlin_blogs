class CreateHainanFruits < ActiveRecord::Migration

  def up
    create_table :hainan_fruits do |t|
      t.string :name
      t.string :color
    end
  end

  def down
    drop_table :hainan_fruits
  end

end

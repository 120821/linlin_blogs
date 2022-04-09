class Rename < ActiveRecord::Migration

  def up
    rename_column :hainan_fruits, :color, :age
  end

  def down
    rename_column  :hainan_fruits, :age, :color
  end
end

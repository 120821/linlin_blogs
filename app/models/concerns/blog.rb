class Blog  < ActiveRecord::Base
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :time

      t.timestamps null: false
    end
  end
end

class AddColumnsToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :url, :string
    add_column :blogs, :edit_url, :string
    add_column :blogs, :category, :string
  end
end

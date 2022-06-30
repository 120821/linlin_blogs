class Blog < ActiveRecord::Base
  has_many :categories

  after_save do
#    Category.create name: self.category.try(:name), blog_id: self.id
  end
end

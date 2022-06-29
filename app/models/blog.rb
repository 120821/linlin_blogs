class Blog < ActiveRecord::Base
  has_many :categories
end

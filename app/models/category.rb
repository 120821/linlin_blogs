class Category < ActiveRecord::Base
  belongs_to :blog, optional: true
end

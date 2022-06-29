class Blog < ActiveRecord::Base
  belong_to :category, optional: true
end

class CategoriesDetail < ActiveRecord::Base

  belongs_to :category
  belongs_to :institute

end

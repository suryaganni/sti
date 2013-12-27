class Course < ActiveRecord::Base

  belongs_to :institute

  has_many :categories, :through => :categories_combinations
  has_many :categories_combinations

end

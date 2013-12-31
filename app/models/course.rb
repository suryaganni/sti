class Course < ActiveRecord::Base

  belongs_to :institute

  has_many :categories, :through => :categories_combinations
  has_many :categories_combinations

  accepts_nested_attributes_for :categories_combinations, allow_destroy: true

end

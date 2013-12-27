class Category < ActiveRecord::Base

  has_many :institutes, :through => :categories_details
  has_many :categories_details

  has_many :sub_categories, :foreign_key => "parent_id", :class_name => "::Category"
  belongs_to :category, :foreign_key => "parent_id",:class_name => "::Category"

  has_many :courses, :through => :categories_combinations
  has_many :categories_combinations

end

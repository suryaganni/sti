class Category < ActiveRecord::Base

#  has_many :institutes, :through => :categories_details
#  has_many :categories_details

  has_many :sub_categories, :foreign_key => "parent_id", :class_name => "::Category"
  belongs_to :category, :foreign_key => "parent_id",:class_name => "::Category"

  has_many :courses, :through => :categories_combinations
  has_many :categories_combinations

  def parent
    self.category
  end

  def self.categories_group
    grouped_categories = []
    Category.where("parent_id is null").each do |c|
      parent_categories = c.name
      sub_categories = []
      c.sub_categories.each do |sc|
        sub_categories << [sc.name, sc.id]
      end
      grouped_categories << [parent_categories, sub_categories]
    end
    return grouped_categories
  end

end

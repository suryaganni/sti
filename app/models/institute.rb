class Institute < ActiveRecord::Base

  belongs_to :user

#  has_many :categories, :through => :categories_combination
#  has_many :categories_combination

  has_many :courses

  accepts_nested_attributes_for :courses, allow_destroy: true

end

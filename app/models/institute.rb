class Institute < ActiveRecord::Base

  belongs_to :user

  has_many :categories, :through => :categories_details
  has_many :categories_details

  has_many :courses

end

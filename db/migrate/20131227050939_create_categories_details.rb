class CreateCategoriesDetails < ActiveRecord::Migration
  def change
    create_table :categories_details do |t|
      t.integer :category_id
      t.integer :institute_id
      t.float :duration
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

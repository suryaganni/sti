class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :institute_id
      t.float :price

      t.timestamps
    end
  end
end

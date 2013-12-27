class CreateCategoriesCombinations < ActiveRecord::Migration
  def change
    create_table :categories_combinations do |t|
      t.integer :category_id
      t.integer :course_id

      t.timestamps
    end
  end
end

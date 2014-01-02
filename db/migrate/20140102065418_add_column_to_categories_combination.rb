class AddColumnToCategoriesCombination < ActiveRecord::Migration
  def change
    add_column :categories_combinations, :start_date, :date
    add_column :categories_combinations, :end_date, :date
    add_column :categories_combinations, :start_time, :time
    add_column :categories_combinations, :end_time, :time
    add_column :categories_combinations, :duration, :float
  end
end

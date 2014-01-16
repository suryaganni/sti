require 'spec_helper'

describe CategoriesCombination do
  it { should belong_to(:category) }
  it { should have_db_index(:category_id) }
  it { should belong_to(:course) }
  it { should have_db_index(:course_id) }
end

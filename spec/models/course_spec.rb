require 'spec_helper'

describe Course do
 it { should validate_presence_of(:name) }
 it { should belong_to(:institute) }
 it { should have_db_index(:institute_id) }
 it { should have_many(:categories).through(:categories_combinations) }
 it { should have_many(:categories_combinations) }
 it { should accept_nested_attributes_for(:categories_combinations).allow_destroy(true) }
end

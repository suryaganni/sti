require 'spec_helper'

describe Category do
#  it { should validate_uniqueness_of(:name).scoped_to(:parent_id) }
  it { should have_many(:sub_categories) }
  it { should belong_to(:category).with_foreign_key('parent_id').class_name('Category') }
  it { should have_db_index(:parent_id) }
  it { should have_many(:courses) }
  it { should have_many(:categories_combinations) }

  context "Parent" do
   par = FactoryGirl.create(:category, name: "parent", parent_id: nil)
   child = FactoryGirl.create(:category, name: "child", parent_id: par.id)
   it { child.parent.should eq(par) }
  end
end

require 'spec_helper'

describe Institute do
  it { should belong_to(:user) }
  it { should have_db_index(:user_id) }
  it { should have_many(:courses) }
  it { should accept_nested_attributes_for(:courses).allow_destroy(true) }
end

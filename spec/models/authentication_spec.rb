require 'spec_helper'

describe Authentication do
  it { should belong_to(:user) }
  it { should have_db_index(:user_id) }
end

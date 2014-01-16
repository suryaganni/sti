FactoryGirl.define do
  factory :institute do
    sequence(:name) {|n| "test name #{n}" }
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "test#{n}@test.com" }
    password "test1234"
    password_confirmation "test1234"
  end
end

FactoryGirl.define do
  factory :category do
    sequence(:name) {|n| "category_#{n}" }
  end
end

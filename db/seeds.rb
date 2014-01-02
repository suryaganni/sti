data = { "IT" => ["Java", "Ruby", ".Net", "c#", "Angularjs", "Backbonejs"], "Non-IT" => ["Spoken English", "BPO Services", "Interview Skills", "HR Traning"], "Others" => ["Painting", "Dance", "Music"] }
data.each do |key, value|
  c = Category.create(name: key)
  value.each do |sub_cat|
    c.sub_categories.create(name: sub_cat)
  end
end

usr = User.create(email: "test@test.com", password: "test1234", password_confirmation: "test1234")

cat = Category.where(parent_id: !nil)
cat_ids = cat.map(&:id)

["Institute 1", "Institute 2", "Institute 3"].each do |inst|
  ine = usr.institutes.create(name: inst)
  cat.each do |course|
    temp = {}
    Random.rand(1..3).times do |t|
      temp.merge!({(t).to_s => {category_id: cat_ids.sample, start_date: Date.today, end_date: Date.today+2.months, start_time: Time.parse("09:00"), end_time: Time.parse("11:00"), duration: 60.0}})
    end
    ine.courses.create(name: course.parent.name, price: Random.rand(10..999), "categories_combinations_attributes"=>temp)
  end
end

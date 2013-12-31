  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
  end

  create_table "categories_combinations", force: true do |t|
    t.integer  "category_id"
    t.integer  "course_id"
  end

  create_table "categories_details", force: true do |t|
    t.integer  "category_id"
    t.integer  "institute_id"
    t.float    "duration"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "institute_id"
    t.float    "price"
  end

  create_table "institutes", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name"
  end

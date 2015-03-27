ActiveRecord::Schema.define(version: 20150327064543) do

  create_table "urls", force: :cascade do |t|
    t.string   "full_url"
    t.string   "short_url"
    t.string   "title"
    t.integer  "visit_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end

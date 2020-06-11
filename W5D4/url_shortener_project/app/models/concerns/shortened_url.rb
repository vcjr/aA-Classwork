class ShortenedURL < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, presence: true
    validates :user_id, presence: true
end

# create_table "shortened_urls", force: :cascade do |t|
#     t.string "long_url", null: false
#     t.string "short_url", null: false
#     t.integer "user_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["short_url"], name: "index_shortened_urls_on_short_url"
FactoryBot.define do
  factory :photo do
    source { Faker::LoremFlickr.image }
    title { "MyString" }
    description { "MyString" }
  end
end

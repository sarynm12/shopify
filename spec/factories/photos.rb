FactoryBot.define do
  factory :photo do
    source { Faker::LoremFlickr.image }
    title { Faker::Hipster.word }
    description { Faker::Hipster.sentence }
    user
  end
end

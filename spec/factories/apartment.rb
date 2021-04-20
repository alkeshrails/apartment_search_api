FactoryBot.define do
  factory :apartment do
    title { Faker::Lorem.sentence(word_count: 3) }
    price { Faker::Number.number(digits: 3) }
    sqm { Faker::Number.number(digits: 3) }
    number_of_bedrooms { Faker::Number.number(digits: 1) }
    number_of_bathrooms { Faker::Number.number(digits: 1) }
    picture { Faker::LoremFlickr.image(size: '50x60', search_terms: ['apartment']) }
  end
end

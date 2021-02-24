FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(sentence_count: 15, supplemental: true) }
    published { [:pending, :published].sample }
    contrast { 0 }
    created_by { User.first }
  end
end

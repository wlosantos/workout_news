FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(sentence_count: 15, supplemental: true) }
    published { [:pending, :published].sample }
    tag_list { Faker::Lorem.word }
    contrast { 0 }
    created_by { User.all.sample }
  end
end

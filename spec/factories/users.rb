FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
     username { Faker::Name.unique.middle_name }
     email { Faker::Internet.unique.email }
     password { '123456' }
     kind { :user }
     status { :active }
  end
end

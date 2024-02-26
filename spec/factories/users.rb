FactoryBot.define do
  # FactoryBot builds objects with the dummy data generated with Faker using the lines below
  factory :user do
    username { Faker::Internet.username}
    email {Faker::Internet.email}
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

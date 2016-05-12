FactoryGirl.define do
  factory :user do
    password = FFaker::Internet.password(8)
    email                 { FFaker::Internet.email }
    password              password
    password_confirmation password
    nickname              { FFaker::Name.name }
    first_name            { FFaker::Name.first_name }
    last_name             { FFaker::Name.last_name }
  end
end

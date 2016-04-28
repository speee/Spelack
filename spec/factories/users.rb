FactoryGirl.define do
  factory :user do
    email                 { FFaker::Internet.email }
    password              '00000000'
    password_confirmation '00000000'
    nickname              'abc'
    first_name            'abc'
    last_name             'abc'
  end
end

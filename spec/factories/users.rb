FactoryGirl.define do
  factory :user do
    email                 { FFaker::Internet.email }
    password              '00000000'
    password_confirmation '00000000'
    nickname              'abc'
    first_name            'abc'
    last_name             'abc'
    confirmed_at          { Time.zone.now }
    confirmation_sent_at  { Time.zone.now }
    confirmation_token    '9zdxfHWNyJXDGqKCwNn5'
  end

  # factory :user do
  #   email                 'foo@example.com'
  #   password              '00000000'
  #   password_confirmation '00000000'
  #   nickname              'abc'
  #   first_name            'abc'
  #   last_name             'abc'
  #   confirmed_at          { Time.zone.now }
  #   confirmation_sent_at  { Time.zone.now }
  #   confirmation_token    '9zdxfHWNyJXDGqKCwNn5'
  # end
end

FactoryGirl.define do
  factory :channel do
    name 'a' * 50
    is_private 0
    description 'a' * 1000
    created_user_id 1
  end
end

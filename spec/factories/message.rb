FactoryGirl.define do
  factory :message do
    text FFaker::BaconIpsum.characters(50)
    user_id 1
    channel_id 1
  end
end

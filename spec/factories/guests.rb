FactoryGirl.define do
  factory :guest do
    guest_group
    name 'First Last'
    attending true
  end
end

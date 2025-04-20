FactoryBot.define do
  factory :shipping_address do
    postal_code { 'MyString' }
    prefecture_id { 2 }
    city { 'MyString' }
    addresses { 'MyString' }
    building { 'MyString' }
    phone_number { 'MyString' }
    association :order
  end
end

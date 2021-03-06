FactoryBot.define do
  factory :address_purchase do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    home_number { '1-1' }
    building_name { 'メゾンハイツ' }
    phone_number { '0900000000' }
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
    user_id { 1 }
    item_id { 1 }
  end
end

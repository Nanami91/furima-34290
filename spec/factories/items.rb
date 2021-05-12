FactoryBot.define do
  factory :item do
    
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png', content_type: 'image/png')
    end

    item_name           {"商品名"}
    description         { Faker::Lorem.sentence }
    category_id         {2}
    status_id           {2}
    shipping_charge_id  {2}
    prefecture_id       {2}
    shipping_days_id    {2}
    price               {1000}
    association :user
  end
end

FactoryBot.define do
  factory :comment do
    text           {"購入したいです"}
    user_id        { 1 }
    item_id        { 1 }
  end
end

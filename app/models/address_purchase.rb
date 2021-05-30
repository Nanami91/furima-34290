class AddressPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :home_number, :building_name, :phone_number, :item_id, :user_id, :price, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "code is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :home_number
    validates :phone_number, numericality: { only_integer: true, message: "Input half-width characters"}
    validates :token
    validates :item_id
    validates :user_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :phone_number, length: { in: 10..11 , message: "is too short"}

  def save
    item_purchase = ItemPurchase.create(item_id: @item_id, user_id: @user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, home_number: home_number, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end

end
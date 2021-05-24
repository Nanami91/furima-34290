class AddressPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :home_number, :building_name, :phone_number, :item_purchase, :item, :user

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :home_number
    validates :phone_number, numericality: { only_integer: true, message: "Input half-width characters"}
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
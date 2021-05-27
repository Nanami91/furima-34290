class Item < ApplicationRecord

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  with_options presence: true do

    validates :image
    validates :item_name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range" }

    with_options numericality: { other_than: 1, message:"can't be blank" } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_days_id
    end
  end

  validates :price, numericality: { only_integer: true, message: "Input half-width characters"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_days

end

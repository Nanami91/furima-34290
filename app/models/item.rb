class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do

    validates :item_name
    validates :description
    validates :price

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_days_id
    end

    validates :image, unless: :was_attached?
    def was_attached?
     self.image.attached?
    end

  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_days
end

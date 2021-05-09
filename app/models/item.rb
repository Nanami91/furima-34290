class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do

    validates :item_name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price

    validates :image, unless: :was_attached?
    def was_attached?
     self.image.attached?
    end

  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品を出品できるとき' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.item_name = nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '説明が空では出品できない' do
        @item.description = nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が空では出品できない' do
        @item.status_id  = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '発送料が空では出品できない' do
        @item.shipping_charge_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送地域が空では出品できない' do
        @item.prefecture_id  = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送日数が空では出品できない' do
        @item.shipping_days_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end
      it '値段が空では出品できない' do
        @item.price = nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '値段が全角数字では出品できない' do
        @item.price = "１０００"
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price Input half-width characters")
      end
      it '値段が半角英数混合では出品できない' do
        @item.price = "11aa"
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price Input half-width characters")
      end
      it '値段が半角英語だけでは出品できない' do
        @item.price = "aaaa"
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price Input half-width characters")
      end
      it '値段が299円以下では出品できない' do
        @item.price = "299"
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it '値段が10,000,000以上ではでは出品できない' do
        @item.price = "10000000"
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end
require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @address_purchase = FactoryBot.build(:address_purchase)
  end

  context '内容に問題ない場合' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@address_purchase).to be_valid
    end
  end

  context '住所を登録できないとき' do
    it 'post_codeが空だと保存できないこと' do
      @address_purchase.post_code = ''
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Post code can't be blank")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @address_purchase.prefecture_id = 1
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @address_purchase.city = ''
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'home_numberが空だと保存できないこと' do
      @address_purchase.home_number = ''
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Home number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @address_purchase.phone_number = ''
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
  end
  
  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @address_purchase.price = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Price can't be blank")
    end
  
    it "tokenが空では登録できないこと" do
      @address_purchase.token = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end

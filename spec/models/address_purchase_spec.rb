require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @address_purchase = FactoryBot.build(:address_purchase)
  end

  context '内容に問題ない場合' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@address_purchase).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @address_purchase.building_name = ''
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

    it 'post_codeがハイフンなしでは保存できないこと' do
      @address_purchase.post_code = '1111111'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
    end
    it 'phone_numberが12桁以上では保存できないこと' do
      @address_purchase.phone_number = '090123456789'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number is too long")
    end
    it 'phone_numberが英数混合では保存できないこと' do
      @address_purchase.phone_number = '090abcd1234'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number Input half-width characters")
    end
  end

  
  context '内容に問題がある場合' do
  
    it "tokenが空では登録できないこと" do
      @address_purchase.token = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空では保存できないこと' do
      @address_purchase.user_id = ''
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では保存できないこと' do
      @address_purchase.item_id = ''
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Item can't be blank")
    end
  end
end

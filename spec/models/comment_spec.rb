require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do

    context 'コメントができないとき' do
      it 'textが空だとコメントできない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'user_idが空では保存できないこと' do
        @comment.user_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @comment.item_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

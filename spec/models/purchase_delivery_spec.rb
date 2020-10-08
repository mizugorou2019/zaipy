require 'rails_helper'

describe OrderDelivery, type: :model do
  describe '物資購入' do
    before do
      @order_delivery = FactoryBot.build(:order_delivery)
    end
    context '購入がうまくいくとき' do
      it '全ての項目が存在すれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameがなくても購入できる' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと購入できない' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンが無いと購入できない' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Post code is invalid. Hyphen is necessary.')
      end
      it 'prefectureが空だと購入できない' do
        @order_delivery.prefecture_id = '0'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank.")
      end
      it 'cityが空だと購入できない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @order_delivery.house_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid. Hyphen is unnecessary.')
      end
      it 'phone_numberが9文字以下だと購入できない' do
        @order_delivery.phone_number = '022512345'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid. Hyphen is unnecessary.')
      end
    end
  end
end

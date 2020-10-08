require 'rails_helper'

describe Item, type: :model do
  describe '物資内容登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('sample.jpg')
    end
    context '登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'nameが20文字以下なら登録できる' do
        @item.name = 'aaaaaaaaaabbbbbbbbbb'
        expect(@item).to be_valid
      end
      it 'descriptionが100文字以下であれば登録できる' do
        @item.description =
          'この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、'
        expect(@item).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが21文字以上だと登録できない' do
        @item.name = 'aaaaaaaaaabbbbbbbbbbc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 20 characters)')
      end
      it 'descriptionが空であれば登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'descriptionが101文字以上であれば登録できない' do
        @item.description =
          'この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。
        この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。
        この文章はダミーです。文字の大きさ、量'
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 100 characters)')
      end
      it 'categoryが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end

require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'スタッフ情報登録' do
    context '新規登録がうまくいくとき' do
      it 'name、tel_num, password、password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nameが15文字以下で登録できる' do
        @user.name = '田中太郎'
        expect(@user).to be_valid
      end
      it 'passwordが8文字以上であれば登録できる' do
        @user.password = 'abc12345'
        @user.password_confirmation = 'abc12345'
        expect(@user).to be_valid
      end
    end

    context 'スタッフ登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが16文字以上では登録できない' do
        @user.name = 'ああああああああああああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is too long (maximum is 15 characters)')
      end
      it 'name_kanaがカタカナ以外だと登録できない' do
        @user.name_kana = '田中太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana is invalid. Input full-width katakana characters.')
      end
      it 'tel_numが空では登録できない' do
        @user.tel_num = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Tel num is invalid. Input only digits. Hyphen is unnecessary.')
      end
      it 'tel_numが携帯番号以外では登録できない' do
        @user.tel_num = '02251234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Tel num is invalid. Input only digits. Hyphen is unnecessary.')
      end
      it 'ハイフン入りのtel_numでは登録できない' do
        @user.tel_num = '090-1234-5678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Tel num is invalid. Input only digits. Hyphen is unnecessary.')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが7文字以下では登録できない' do
        @user.password = 'abc1234'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは英数字が混在していないと登録できない' do
        @user.password = '11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password needs alphabet and number')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do

      it '全てのカラムが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上で半角英数混同であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに`@`が含まれていないとユーザー登録できない' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwoedが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '英字も含めなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it '数字も含めなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'prefectureがid_1(未選択)では保存できない' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空では保存できないこと' do
        @user.city = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end

      it 'sexがid_1(未選択)では保存できない' do
        @user.sex_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Sex must be other than 1')
      end

      it 'ageがid_1(未選択)では保存できない' do
        @user.age_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Age must be other than 1')
      end

    end

  end
end
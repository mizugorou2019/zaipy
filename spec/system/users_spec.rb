require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'トップページに移動する' do
    # トップページに遷移する
    visit root_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq root_path
  end

  it 'スタッフ登録に成功し、トップページに遷移する' do
    # 登録ページに遷移する
    visit new_user_registration_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_registration_path

    # スタッフ情報を入力する
    fill_in 'name', with: '亜衣上尾子'

    fill_in 'name-kana', with: 'アイウエオコ'

    fill_in 'tel_num', with: '09012345678'

    fill_in 'password', with: 'abc12345'

    fill_in 'password-confirmation', with: 'abc12345'

    # スタッフ情報登録ボタンをクリックする
    click_on('commit')

    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end

  it 'スタッフ登録に失敗し、再び登録ページに戻ってくる' do
    # 登録ページに遷移する
    visit new_user_registration_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_registration_path

    # 確認用パスワードを間違えて入力する
    fill_in 'name', with: '亜衣上尾子'

    fill_in 'name-kana', with: 'アイウエオコ'

    fill_in 'tel_num', with: '09012345678'

    fill_in 'password', with: 'abc12345'

    fill_in 'password-confirmation', with: 'abc123456'

    # スタッフ情報登録ボタンをクリックする
    click_on('commit')

    # トップページに遷移していることを確認する
    expect(current_path).to eq user_registration_path
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # サインインページへ移動する
    visit new_user_session_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path

    # すでに保存されているユーザーのnameとpasswordを入力する
    fill_in 'name', with: @user.name
    fill_in 'password', with: @user.password

    # ログインボタンをクリックする
    click_on('commit')

    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # ログインページに遷移させる
    visit new_user_session_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'name', with: 'test'
    fill_in 'password', with: 'example@test.com'

    # ログインボタンをクリックする
    click_on('commit')

    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq new_user_session_path
  end
end

# frozen_string_literal: true

require 'rails_helper'


  describe "管理者ログイン画面のテスト" do
    context '表示の確認' do
      before do
        visit new_admin_session_path
      end

      it 'タイトルの表示' do
        expect(page).to have_content "管理者ログイン"
      end
      it '入力フォームの有無' do
        expect(page).to have_field 'admin[email]'
        expect(page).to have_field 'admin[password]'
      end
      it 'ログインボタンの有無' do
        expect(page).to have_button 'ログイン'
      end
    end
    
    context 'ログインしてみる' do
      it 'ログインする' do
        visit new_admin_session_path
        Admin.create(email:'admin@admin.com',password:'password')
        
      end
    end
  end

# frozen_string_literal: true

require 'rails_helper'

describe '問題のテスト' do

  describe "問題一覧のテスト" do

    context '表示の確認' do
      before do
        visit admin_questions_path
      end

      it 'カテゴリの一覧表示と新規登録ボタン、id検索窓が同一画面に表示されているか' do
      end
    end
  end
end

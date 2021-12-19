# frozen_string_literal: true

require 'rails_helper'

describe '新規作成のテスト' do
  let!(:question) { create(:question, question_text:'hoge',category_id:1 ) }
  # describe 'トップ画面(top_path)のテスト' do
  #   before do
  #     visit top_path
  #   end
  #   context '表示の確認' do
  #     it 'トップ画面(top_path)に「ここはTopページです」が表示されているか' do
  #       expect(page).to have_content 'ここはTopページです'
  #     end
  #     it 'top_pathが"/top"であるか' do
  #       expect(current_path).to eq('/top')
  #     end
  #   end
  # end


  describe "問題一覧のテスト" do
    before do
      visit admin_questions_path
    end
    context '表示の確認' do
      it '新規作成した問題が表示されているか' do
        expect(page).to have_content question.question_text
        # expect(page).to have_link list.title
      end
    end
  end
end
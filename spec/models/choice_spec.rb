# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Choiceモデルのテスト', type: :model do
  describe '新規作成のテスト' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.create(:choice)).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    subject { choice.valid? }

    let(:question) { create(:question) }
    let!(:choice) { build(:choice, question_id: question.id) }

    context 'choice_textカラム' do
      it '空欄でないこと' do
        choice.choice_text = ''
        is_expected.to eq false
      end
    end

    context 'question_idカラム' do
      it '空欄でないこと' do
        choice.question_id = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Questionモデルとの関係' do
      it 'N:1となっている' do
        expect(Choice.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end
  end
end

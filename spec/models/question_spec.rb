# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questionモデルのテスト', type: :model do
  describe '新規作成のテスト' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.create(:question)).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    subject { question.valid? }

    let(:category) { create(:category) }
    let!(:question) { build(:question, category_id: category.id) }

    context 'question_textカラム' do
      it '空欄でないこと' do
        question.question_text = ''
        is_expected.to eq false
      end
    end

    context 'category_idカラム' do
      it '空欄でないこと' do
        question.category_id = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Categoryモデルとの関係' do
      it 'N:1となっている' do
        expect(Question.reflect_on_association(:category).macro).to eq :belongs_to
      end
    end

    context 'Choiceモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:choices).macro).to eq :has_many
      end
    end
    context 'AchievementRateモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:achievement_rates).macro).to eq :has_many
      end
    end
    context 'CorrectAnswerRateモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:correct_answer_rates).macro).to eq :has_many
      end
    end
  end
end

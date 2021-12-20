# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categoryモデルのテスト', type: :model do
  describe '新規作成のテスト' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.build(:category)).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    subject { category.valid? }

    let!(:category) { build(:category) }

    context 'nameカラム' do
      it '空欄でないこと' do
        category.name = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(Category.reflect_on_association(:questions).macro).to eq :has_many
      end
    end

    context 'AchievementRateモデルとの関係' do
      it '1:Nとなっている' do
        expect(Category.reflect_on_association(:achievement_rates).macro).to eq :has_many
      end
    end

    context 'CorrectAnswerRateモデルとの関係' do
      it '1:Nとなっている' do
        expect(Category.reflect_on_association(:correct_answer_rates).macro).to eq :has_many
      end
    end
  end
end

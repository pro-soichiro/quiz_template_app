# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AchievementRateモデルのテスト', type: :model do
  describe '新規作成のテスト' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.create(:achievement_rate)).to be_valid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(AchievementRate.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end

    context 'Staffモデルとの関係' do
      it '1:Nとなっている' do
        expect(AchievementRate.reflect_on_association(:staff).macro).to eq :belongs_to
      end
    end

    context 'Categoryモデルとの関係' do
      it '1:Nとなっている' do
        expect(AchievementRate.reflect_on_association(:category).macro).to eq :belongs_to
      end
    end
  end
end

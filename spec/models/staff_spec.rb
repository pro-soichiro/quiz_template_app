# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Staffモデルのテスト', type: :model do
  describe '新規作成のテスト' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.build(:staff)).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    subject { staff.valid? }

    let(:staff) { build(:staff) }

    context 'first_nameカラム' do
      it '空欄でないこと' do
        staff.first_name = ''
        is_expected.to eq false
      end
      it '4文字以下であること: 4文字は〇' do
        staff.first_name = Faker::Lorem.characters(number: 4)
        is_expected.to eq true
      end
      it '4文字以下であること: 5文字は×' do
        staff.first_name = Faker::Lorem.characters(number: 5)
        is_expected.to eq false
      end
    end

    context 'last_nameカラム' do
      it '空欄でないこと' do
        staff.last_name = ''
        is_expected.to eq false
      end
      it '4文字以下であること: 4文字は〇' do
        staff.last_name = Faker::Lorem.characters(number: 4)
        is_expected.to eq true
      end
      it '4文字以下であること: 5文字は×' do
        staff.last_name = Faker::Lorem.characters(number: 5)
        is_expected.to eq false
      end
    end

    context 'first_name_kanaカラム' do
      it '空欄でないこと' do
        staff.first_name_kana = ''
        is_expected.to eq false
      end
      it 'カタカナであること: カタカナは〇' do
        staff.first_name_kana = 'カタカナ'
        is_expected.to eq true
      end
      it 'カタカナであること: カタカナ以外は×' do
        staff.first_name_kana = Faker::Lorem.characters(number: 4)
        is_expected.to eq false
      end
    end

    context 'last_name_kanaカラム' do
      it '空欄でないこと' do
        staff.last_name_kana = ''
        is_expected.to eq false
      end
      it 'カタカナであること: カタカナは〇' do
        staff.last_name_kana = 'カタカナ'
        is_expected.to eq true
      end
      it 'カタカナであること: カタカナ以外は×' do
        staff.last_name_kana = Faker::Lorem.characters(number: 4)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'AchievementRateモデルとの関係' do
      it '1:Nとなっている' do
        expect(Staff.reflect_on_association(:achievement_rates).macro).to eq :has_many
      end
    end

    context 'CorrectAnswerRateモデルとの関係' do
      it '1:Nとなっている' do
        expect(Staff.reflect_on_association(:correct_answer_rates).macro).to eq :has_many
      end
    end
  end
end

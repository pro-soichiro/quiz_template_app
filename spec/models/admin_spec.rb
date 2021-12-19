# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Adminモデルのテスト', type: :model do
  describe '新規作成のテスト' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.build(:admin)).to be_valid
    end
  end
end

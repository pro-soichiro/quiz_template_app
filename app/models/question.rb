class Question < ApplicationRecord

  belongs_to :category

  has_many :choices,                dependent: :destroy
  has_many :achievement_rates,      dependent: :destroy
  has_many :correct_answer_rates,   dependent: :destroy

  attachment :image

  validates :category_id, presence: true
  validates :question_text, presence: true

	accepts_nested_attributes_for :choices , allow_destroy: true

	ransacker :id do Arel.sql("CAST(#{table_name}.id as CHAR(8))") end

  # importによる問題作成
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      question = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      question.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      question.save
    end
  end

  # importによる更新を許可
  def self.updatable_attributes
    ["id", "category_id", "question_text"]
  end

end

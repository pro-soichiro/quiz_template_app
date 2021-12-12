class Choice < ApplicationRecord
  belongs_to :question
  validates :choice_text, presence: true

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
    ["id", "question_id", "choice_text","is_answer"]
  end

end

class QuestionChoice
  include ActiveModel::Model

  attr_accessor :category_id,
                :question_text,
                :image,
                :question_id,
                :choice_text,
                :is_answer

  # attachment :image

  validates :category_id, presence: true
  validates :question_text, presence: true

  validates :question_id, presence: true
  validates :choice_text, presence: true


  def saves
    question = Question.create( category_id: category_id,
                                question_text: question_text,
                                image: image)
    Choice.create(question_id: question.id,
                  choice_text: choice_text,
                  is_answer: is_answer)
  end

end
class Form::Question < Question
  REGISTRABLE_ATTRIBUTES = %i(category_id question_text image)
  has_many :choices, class_name: 'Form::Choice'
end
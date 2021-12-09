class Admin::ChoicesController < ApplicationController
  def destroy
    choice = Choice.find(params[:id])
    question = Question.find(choice.question_id)
    choice.destroy
		redirect_to edit_admin_question_path(question.id)
  end
end

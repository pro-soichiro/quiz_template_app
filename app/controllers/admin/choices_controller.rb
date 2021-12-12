class Admin::ChoicesController < ApplicationController
  def destroy
    choice = Choice.find_by(id: params[:id])
    question = choice.question.id
    choice.destroy
		redirect_to edit_admin_question_path(question)
  end
  
  def import
    Choice.import(params[:file])
    redirect_to new_admin_question_path
  end
end

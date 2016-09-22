class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def show
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def new
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: 'Answer was successfully created.'
    else
      @errors = @answer.errors.full_messages.join('')
      redirect_to question_path(@question), notice: @errors
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end

class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.all.where(question_id: @question.id)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Question successfully created.'
      redirect_to @question
    else
      @errors = @question.errors.full_messages.join(', ')
      render action: 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
    render action: 'edit'
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = 'Question successfully updated.'
        redirect_to @question
      else
        @errors = @question.errors.full_messages.join(', ')
        render action: 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: 'Question successfully deleted.'
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end

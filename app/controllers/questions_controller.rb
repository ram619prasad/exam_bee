class QuestionsController < ApplicationController
    before_action :find_question, only: [:answers]

    def import
        Question.import(question_params[:file])
        head :ok
    rescue => e
        render json: { error: 'Error importing questions.' }, status: :unprocessable_entity
    end

    def index
        questions = Question.all
        render json: questions
    end

    def answers
        render json: @question.answers
    end

    private

    def find_question
        @question = Question.find(params[:id])
    rescue => e
        render json: { error: 'Question not found.' }, status: :not_found
    end

    def question_params
        params.permit(:file)
    end
end

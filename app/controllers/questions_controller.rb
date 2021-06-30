class QuestionsController < ApplicationController
    def import
        Question.import(params[:file])
        head :ok
    rescue => e
        byebug
        render json: { error: 'Error importing questions.' }, status: :unprocessable_entity
    end

    def index
        questions = Question.all
        render json: questions
    end

    private

    def question_params
        params.permit(:file)
    end
end

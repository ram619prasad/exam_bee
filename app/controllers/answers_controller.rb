class AnswersController < ApplicationController
    def import
        Answer.import(answer_params[:file])
        head :ok
    rescue => e
        render json: { error: 'Error importing answers.' }, status: :unprocessable_entity
    end

    def index
        render json: Answer.all
    end

    private

    def answer_params
        params.permit(:file)
    end
end

class ExamsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def output
		render json: Exam.all
		return
	end

	def create
		@examset = ExamSet.new
		@examset.question = params[:exam_set][:question]
		@examset.tips = params[:exam_set][:tips]
		@examset.answer = params[:exam_set][:answer]
		@examset.user_id = params[:exam_set][:user_id]
		@examset.save
		if @examset.save
			render json: @examset.id
		else
			render json: '0'
		end
	end

	def search
		if User.find(params[:user_id]).present?
			render json: User.find(params[:user_id]).exam_sets.pluck(:id)
		else
			render json: "User Not Found"
		end
	end

	def print_exam_set
		if ExamSet.find(params[:exam_set_id]).present?
			render json: ExamSet.find(params[:exam_set_id])
		else
			render json: "ExamSet Not Found"
		end
	end
	private
	def exam_params
		params.require(:exam_set).permit(:question,:answer,:tips,:user_id)
	end
end

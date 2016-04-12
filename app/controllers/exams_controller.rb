class ExamsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def output
		render json: Exam.where(id: (1..Exam.count).to_a.shuffle.first(25))
		return
	end
	
	# def index
	# 	(1..3).each do |exam|
	# 		Exam.create(question: "testing" , answer: "testing" ,tips: "testing" , level: 3)
	# 	end
	# end

	def create
		@examset = ExamSet.new
		@examset.question = params[:exam_set][:question]
		@examset.tips = params[:exam_set][:tips]
		@examset.answer = params[:exam_set][:answer]
		@examset.user_id = params[:exam_set][:user_id]
		@examset.name = params[:exam_set][:name]
		@examset.save
		if @examset.save
			render json: @examset.id
		else
			render json: '0'
		end
	end

	def search
		if User.find(params[:user_id]).present?
			render json: {name: User.find(params[:user_id]).exam_sets.pluck(:name),id: User.find(params[:user_id]).exam_sets.pluck(:id)}
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

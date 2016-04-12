class GameRecordsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		if params[:game_record][:delete].present?
			GameRecord.where(user_id: params[:game_record][:user_id]).destroy_all
			render json: '1'
		else
			@game_record = GameRecord.new
			@game_record.situation = params[:game_record][:situation]
			@game_record.exam = params[:game_record][:exam]
			@game_record.user_id = params[:game_record][:user_id]
			@game_record.save
			if @game_record.save
				render json: '1'
			else
				render json: '0'
			end
		end
	end
	def print_record
		@user = User.find(params[:user_id])
		@record = @user.game_record
		if @record.present?
			@record.exam.each_with_index do |exam,index|
				@record.exam[index] = Exam.find(exam)
			end
		render json: @record
		else
			render json: 'No Reocrd'
		end
	end
end

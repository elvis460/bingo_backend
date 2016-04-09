class UsersController < ApplicationController
	  skip_before_action :verify_authenticity_token

	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user.id
		else
			render json: '0'
		end
	end

	def login
		@user = User.find_by(account: params[:user][:account])
		if @user &&  @user.authenticate(params[:user][:password])
			render json: {user_id: @user.id , identity: @user.identity , score: @user.score}
		else
			render json: {user_id: 0}
		end
	end
	def ranking
		@users = User.order(score: :DESC)
		@names = Hash.new
		@names = @users.first(20).map do |user|
		{ :account => user.account, :score => user.score}
		end
		render json: @names
	end

	def add_score
		@user = User.find(params[:user][:user_id])
		@user.score += params[:user][:score]
		@user.save
		render json: {score: @user.score}
	end

	def check_score
		render json: {score: User.find(params[:user][:user_id]).score}
	end
	private
		def user_params
			params.require(:user).permit(:account,:password,:birthday,:identity)
		end
end

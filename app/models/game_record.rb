class GameRecord < ActiveRecord::Base
	belongs_to :user
	
	serialize :exam
	serialize :situation
end

class ExamSet < ActiveRecord::Base
	belongs_to :user

	serialize :question
	serialize :tips
	serialize :answer
end

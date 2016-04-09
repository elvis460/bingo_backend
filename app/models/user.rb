class User < ActiveRecord::Base
	has_many :exam_sets
	has_one :game_record

	has_secure_password
	validates :account, uniqueness: true
	enum identity: {
		teacher: 0 ,
		student: 1
	}
end

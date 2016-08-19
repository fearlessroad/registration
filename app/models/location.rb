class Location < ActiveRecord::Base
	has_many :attendances 
	has_many :events, through: :attendances
	has_many :users, through: :attendances

	validates :city, :state, presence:true
end

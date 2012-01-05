#encoding: utf-8
class Agent < ActiveRecord::Base
	validates :nome,  
						:presence => true, 
						:length => { :maximum => 200 }
	
	validates :mat,  
						:presence => true, 
						:uniqueness => true, 
						:length => { :maximum => 30 }
						
	has_many :autos, :dependent => :destroy

	def destroy
		return false if autos.any?
		super
	end	

end

class Auto < ActiveRecord::Base
	validates :agent,  
						:presence => true
						
	validates :inicio, :fim, 
						:allow_blank => true,
						:numericality => { :only_integer => true },
						:format => { :with => /\A[+]?\d+\Z/ , :message => "Somente inteiros positivos"},
						:length => { :maximum => 25 }

	
  belongs_to :agent
  
	def self.search(search, page)
 	 if search
  	  find(:all, :conditions => ['data_do_cadastro LIKE ?', "%#{search}%"], :order => "inicio")
  	else
  	  find(:all)
  	end
  	
	  paginate :per_page => 50, :page => page,
             :conditions => ['data_do_cadastro like ?', "%#{search}%"],
             :order => 'inicio'	
  	
	end
	
  validate :inicio_fim_valid

   def inicio_fim_valid
     errors.add(:inicio, " não deve ser menor que inicio") if self.inicio < self.fim
   end

end

class Consultore < ActiveRecord::Base
	has_many :proyectos
	has_many :customers
	belongs_to :user

	scope :misconsultores ,-> (consultor) {where("user_id = ?", consultor)}


	
def to_param

"#{id}-#{nombre.gsub(/(\s)/, '-').gsub(/,|\.|\?|'|"/,'')}"
		
end
    
end

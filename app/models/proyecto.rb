class Proyecto < ActiveRecord::Base
	has_many :customers
	belongs_to :profile
	has_many :consultores

	scope :misproyectos ,-> (proyecto) {where("user_id = ?", proyecto)}

def to_param

"#{id}-#{cliente.gsub(/(\s)/, '-').gsub(/,|\.|\?|'|"/,'')}"
		
end
end

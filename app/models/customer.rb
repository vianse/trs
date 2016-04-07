class Customer < ActiveRecord::Base
	has_many :proyectos
	has_many :consultores
	belongs_to :profile
	scope :by_clientes ,-> (customer) {where("user_id = ?", customer)}
	scope :list_clientes ,-> (customer) {where("user_id = ?", customer)}
	
	def to_param
		"#{id}-#{nombre.gsub(/(\s)/, '-').gsub(/,|\.|\?|'|"/,'')}"
		end
end

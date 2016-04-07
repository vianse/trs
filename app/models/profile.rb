class Profile < ActiveRecord::Base
	self.inheritance_column = nil
	has_many :customers
	has_many :proyectos
	scope :by_user ,-> (profile) {where("user_id = ?", profile)}
		def to_param
		"#{id}-#{nombre.gsub(/(\s)/, '-').gsub(/,|\.|\?|'|"/,'')}"
		end
	
end

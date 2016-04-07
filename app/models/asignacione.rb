class Asignacione < ActiveRecord::Base
	scope :misasignaciones ,-> (asignacion) {where("email = ?", asignacion)}
	scope :ListadoPrincipal ,-> (asignacion,email) {where("id = ? and email =?", asignacion,email)}
end

class Actividade < ActiveRecord::Base
	scope :misasignaciones ,-> (asignacion) {where("email = ?", asignacion)}
	scope :ListadoPrincipal ,-> (asignacion, id_consultor) {where("id_consultora = ? and id_consultor = ?", asignacion, id_consultor )}



end

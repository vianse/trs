class CreateAsignaciones < ActiveRecord::Migration
  def change
    create_table :asignaciones do |t|
      t.string :id_consultora
      t.string :email
      t.string :cliente
      t.string :proyecto
      t.string :horaInicio
      t.string :horaFin

      t.timestamps
    end
  end
end

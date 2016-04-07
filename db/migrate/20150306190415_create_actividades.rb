class CreateActividades < ActiveRecord::Migration
  def change
    create_table :actividades do |t|
      t.string :diaActual
      t.string :horaEntrada
      t.string :horaSalida
      t.string :actividad
      t.string :diaLetra
      t.string :horasTrabajadas
      t.string :dias
      t.string :medioDia
      t.string :HorasExtra
      t.string :horaRemoto

      t.timestamps
    end
  end
end

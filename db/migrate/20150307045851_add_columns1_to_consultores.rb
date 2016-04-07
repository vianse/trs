class AddColumns1ToConsultores < ActiveRecord::Migration
  def change
    add_column :consultores, :multiproyecto, :boolean
    add_column :consultores, :multiempresa, :boolean
    add_column :consultores, :horaEntrada, :string
    add_column :consultores, :horaSalida, :string
  end
end

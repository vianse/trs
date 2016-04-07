class AddColumnsToActividades < ActiveRecord::Migration
  def change
    add_column :actividades, :id_consultora, :string
    add_column :actividades, :id_consultor, :string
    add_column :actividades, :id_proyecto, :string
  end
end

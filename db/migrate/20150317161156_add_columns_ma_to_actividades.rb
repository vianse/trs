class AddColumnsMaToActividades < ActiveRecord::Migration
  def change
    add_column :actividades, :mes, :string
    add_column :actividades, :ano, :string
  end
end

class AddColumnsToProyectos < ActiveRecord::Migration
  def change
    add_column :proyectos, :nombreProyecto, :string
  end
end

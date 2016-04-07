class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :cliente
      t.string :lider
      t.string :gerente
      t.string :user_id

      t.timestamps
    end
  end
end

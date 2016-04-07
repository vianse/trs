class CreateConsultores < ActiveRecord::Migration
  def change
    create_table :consultores do |t|
      t.string :nombre
      t.string :email
      t.string :cliente
      t.string :proyecto
      t.string :user_id

      t.timestamps
    end
  end
end

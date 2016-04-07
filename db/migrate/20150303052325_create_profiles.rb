class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nombre
      t.string :razonSocial
      t.string :direccion
      t.string :contacto
      t.string :email
      t.string :telOficina
      t.string :telMovil
      t.string :apellidos
      t.string :puesto
      t.string :logo
      t.string :foto
      t.string :type
      t.string :user_id

      t.timestamps
    end
  end
end

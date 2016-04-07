class CreateInvitados < ActiveRecord::Migration
  def change
    create_table :invitados do |t|
      t.string :id_consultora
      t.string :emailInvitado
      t.string :emailConsultor

      t.timestamps
    end
  end
end

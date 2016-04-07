class AddColumnsInvitadosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invitado, :boolean
    add_column :users, :email_consultor, :string
    add_column :users, :email_consultora, :string
  end
end

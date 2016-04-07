class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :nombre
      t.string :razonSocial
      t.string :user_id

      t.timestamps
    end
  end
end

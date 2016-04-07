class CreateFechas < ActiveRecord::Migration
  def change
    create_table :fechas do |t|
      t.string :fecha
      t.string :mes
      t.string :dia
      t.string :diaL
      t.string :mesL
      t.string :año

      t.timestamps
    end
  end
end

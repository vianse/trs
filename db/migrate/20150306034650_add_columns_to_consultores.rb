class AddColumnsToConsultores < ActiveRecord::Migration
  def change
    add_column :consultores, :access, :boolean
  end
end

class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :nome
      t.string :mat
      t.string :turno

      t.timestamps
    end
  end
end

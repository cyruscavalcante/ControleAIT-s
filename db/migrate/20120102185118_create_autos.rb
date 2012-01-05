class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.references :agent
      t.integer :inicio
      t.integer :fim
      t.string :validade
      t.date :data_da_infracao
      t.date :data_do_cadastro

      t.timestamps
    end
    add_index :autos, :agent_id
  end
end

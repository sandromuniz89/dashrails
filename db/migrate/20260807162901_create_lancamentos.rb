class CreateLancamentos < ActiveRecord::Migration[8.1]
  def change
    create_table :lancamentos do |t|
      t.string :descricao
      t.decimal :valor
      t.string :tipo
      t.date :data
      t.string :categoria

      t.timestamps
    end
  end
end

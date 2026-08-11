class CreatePedidos < ActiveRecord::Migration[8.1]
  def change
    create_table :pedidos do |t|
      t.integer :numero
      t.references :cliente, null: false, foreign_key: true
      t.decimal :total
      t.string :status
      t.string :forma_pagamento
      t.string :status_pagamento
      t.string :tipo_logistica
      t.decimal :valor_frete

      t.timestamps
    end
  end
end

class CreateFornecedors < ActiveRecord::Migration[8.1]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :contato
      t.string :categorias
      t.string :prazo_entrega
      t.string :forma_pagamento

      t.timestamps
    end
  end
end

class CreateProdutos < ActiveRecord::Migration[8.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :categoria
      t.string :emoji
      t.decimal :preco_custo
      t.decimal :preco_venda
      t.integer :quantidade
      t.integer :estoque_minimo
      t.string :codigo
      t.text :obs

      t.timestamps
    end
  end
end

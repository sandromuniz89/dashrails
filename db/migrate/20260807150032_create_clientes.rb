class CreateClientes < ActiveRecord::Migration[8.1]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :empresa
      t.string :telefone
      t.string :email
      t.string :cidade
      t.string :estado

      t.timestamps
    end
  end
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_07_162901) do
  create_table "clientes", force: :cascade do |t|
    t.string "cidade"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "empresa"
    t.string "estado"
    t.string "nome"
    t.string "telefone"
    t.datetime "updated_at", null: false
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "categorias"
    t.string "contato"
    t.datetime "created_at", null: false
    t.string "forma_pagamento"
    t.string "nome"
    t.string "prazo_entrega"
    t.datetime "updated_at", null: false
  end

  create_table "item_pedidos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "pedido_id", null: false
    t.decimal "preco_unitario"
    t.integer "produto_id", null: false
    t.integer "quantidade"
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_item_pedidos_on_pedido_id"
    t.index ["produto_id"], name: "index_item_pedidos_on_produto_id"
  end

  create_table "lancamentos", force: :cascade do |t|
    t.string "categoria"
    t.datetime "created_at", null: false
    t.date "data"
    t.string "descricao"
    t.string "tipo"
    t.datetime "updated_at", null: false
    t.decimal "valor"
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "cliente_id"
    t.datetime "created_at", null: false
    t.string "forma_pagamento"
    t.integer "numero"
    t.string "status"
    t.string "status_pagamento"
    t.string "tipo_logistica"
    t.decimal "total"
    t.datetime "updated_at", null: false
    t.decimal "valor_frete"
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "categoria"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.string "emoji"
    t.integer "estoque_minimo"
    t.string "nome"
    t.text "obs"
    t.decimal "preco_custo"
    t.decimal "preco_venda"
    t.integer "quantidade"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "item_pedidos", "pedidos"
  add_foreign_key "item_pedidos", "produtos"
  add_foreign_key "pedidos", "clientes"
end

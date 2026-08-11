json.extract! produto, :id, :nome, :categoria, :emoji, :preco_custo, :preco_venda, :quantidade, :estoque_minimo, :codigo, :obs, :created_at, :updated_at
json.url produto_url(produto, format: :json)

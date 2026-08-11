# 🚀 DashRails - Sistema de Gestão Empresarial

O **DashRails** é um sistema completo de gestão empresarial desenvolvido em **Ruby on Rails**. Projetado com foco em usabilidade, performance e segurança, o sistema conta com uma interface moderna no estilo **Dark/Neon**, permitindo o controle centralizado de estoques, vendas, clientes, fornecedores e métricas financeiras em tempo real.

---

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** [Ruby 3.x](https://www.ruby-lang.org/)
- **Framework Web:** [Ruby on Rails 7.x](https://rubyonrails.org/)
- **Banco de Dados:** SQLite (Desenvolvimento) / PostgreSQL (Produção)
- **Front-end:** HTML5, CSS3 (com CSS Grid/Flexbox), JavaScript
- **Estilização:** Theme Dark/Neon responsivo com menu lateral retrátil
- **Arquitetura:** MVC (Model-View-Controller) com Active Record

---

## 📌 Funcionalidades do Sistema

### 📦 Módulo de Produtos & Estoque
- **CRUD Completo:** Cadastro, listagem, edição e exclusão de produtos.
- **Baixa Automática:** Integração com o módulo de pedidos para atualização automática do estoque a cada venda realizada.

### 👥 Módulo de Clientes & Fornecedores
- **Gestão de Clientes:** Cadastro e histórico de compras.
- **Gestão de Fornecedores:** Vinculação de produtos e controle de dados para reposição.

### 🛒 Módulo de Pedidos
- **Lançamento de Vendas:** Seleção de itens, cálculo automático de totais e baixa direta no estoque.

### 💰 Módulo Financeiro & Relatórios
- **Dashboard Central:** Visão geral das métricas do negócio e indicadores de desempenho (KPIs).
- **Relatórios Gerenciais:** Controle de receitas, despesas e fluxo de caixa.

---

## ⚙️ Como Executar o Projeto Localmente

### Pré-requisitos
- **Ruby** instalado (versão igual ou superior a 3.0)
- **Rails** instalado
- **Bundler** instalado

### Passo a Passo

1. **Clonar o repositório:**
   ```bash
   git clone [https://github.com/sandromuniz89/DashRails.git](https://github.com/sandromuniz89/DashRails.git)
   cd DashRails
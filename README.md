# 🐄 Fazendo BricApp

Aplicação web desenvolvida com Ruby on Rails com foco em organização de categorias e estrutura administrativa (backoffice).

Este projeto foi criado com o objetivo de praticar desenvolvimento web com Rails e aplicar boas práticas de estrutura, além de servir como base para estudos em testes automatizados (QA).

---

## 🚀 Tecnologias utilizadas

* Ruby on Rails
* SQLite3
* HTML / CSS
* Bootstrap (se estiver usando)
* JavaScript

---

## 🧩 Funcionalidades

* Cadastro de categorias
* Edição de categorias
* Exclusão de categorias
* Painel administrativo (Backoffice)
* Estrutura preparada para expansão de funcionalidades

---

## 🧪 Foco em QA (Diferencial)

Este projeto também é utilizado como base para estudos de **Qualidade de Software (QA)**, incluindo:

* Testes automatizados com Capybara + RSpec *(em evolução)*
* Estrutura pensada para testes end-to-end
* Simulação de fluxos reais de usuário

---

## ⚙️ Como rodar o projeto

### Pré-requisitos

* Ruby instalado (versão 3.x)
* Rails instalado
* Bundler

### Passos

```bash
# Clone o repositório
git clone https://github.com/camilascholl/fazendobricapp.git

# Acesse a pasta
cd fazendobricapp

# Instale as dependências
bundle install

# Crie o banco de dados
rails db:create
rails db:migrate

# Inicie o servidor
rails server
```

Acesse no navegador:
👉 http://localhost:3000

---

## 🗂️ Estrutura do projeto

* `app/` → Controllers, Models e Views
* `config/` → Configurações da aplicação
* `db/` → Banco de dados e migrations
* `spec/` → Testes automatizados (quando aplicável)

---

## 🔐 Segurança

* Nenhuma credencial sensível está versionada
* Arquivos como `.env` e `master.key` estão protegidos via `.gitignore`

---

## 📌 Melhorias futuras

* Implementação completa de testes automatizados
* Integração com banco PostgreSQL em produção
* Melhoria de layout e UX
* Autenticação mais robusta no backoffice

---

## 👩‍💻 Autora

Desenvolvido por **Camila Scholl**
💼 Em transição para QA / Automação de Testes

---


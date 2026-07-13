# Kanban App

Uma aplicação Rails para organizar trabalho visualmente com um fluxo Kanban direto e fácil de acompanhar. O objetivo é oferecer uma experiência simples para criar boards, estruturar listas e acompanhar cards enquanto eles avançam entre as etapas do processo.

## Visão geral

O aplicativo foi desenhado para equipes pequenas, projetos pessoais ou qualquer rotina em que seja útil separar tarefas por status. Cada board já nasce com as colunas padrão A Fazer, Fazendo e Concluído, o que reduz configuração inicial e deixa o quadro pronto para uso.

## Principais funcionalidades

- Criação e gerenciamento de boards.
- Criação de listas dentro de cada board.
- Criação de cards dentro de cada lista.
- Reordenação e movimentação de cards entre listas.
- Organização automática dos cards por posição.
- Criação automática das listas iniciais em cada board.

## Stack

- Ruby 3.3.8
- Rails 8.1.1
- SQLite3
- Hotwire
- Turbo
- Stimulus
- Importmap

## Requisitos

- Ruby 3.3.8
- Bundler
- SQLite3

## Como executar

1. Instale as dependências.

```bash
bundle install
```

2. Prepare o banco de dados.

```bash
bin/rails db:setup
```

3. Inicie a aplicação.

```bash
bin/dev
```

Se preferir subir apenas o servidor Rails:

```bash
bin/rails server
```

## Testes

```bash
bin/rails test
```

## Estrutura do domínio

- Um board contém várias listas.
- Uma lista pertence a um board e contém vários cards.
- Um card pertence a uma lista.
- A posição dos cards é mantida para preservar a ordem visual no quadro.

## Organização do projeto

- [app/models](app/models) concentra as regras de domínio.
- [app/controllers](app/controllers) concentra as ações de CRUD e movimentação.
- [app/views](app/views) contém a interface do sistema.
- [config/routes.rb](config/routes.rb) define as rotas aninhadas de boards, lists e cards.

## Evolução futura

Este projeto já entrega uma base sólida para um fluxo Kanban, mas pode evoluir naturalmente com recursos como autenticação, responsáveis, datas de entrega, etiquetas e notificações.

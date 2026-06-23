# Limpa dados antigos (importante quando for resetar o banco)
Card.destroy_all
List.destroy_all
Board.destroy_all

# Cria um board principal
board = Board.create!(name: "Projeto Rails")

# Cria listas padrão do Kanban
todo = board.lists.create!(name: "A Fazer")
doing = board.lists.create!(name: "Fazendo")
done = board.lists.create!(name: "Concluído")

# Cria cards de exemplo
todo.cards.create!(title: "Aprender Rails")
todo.cards.create!(title: "Estudar Active Record")

doing.cards.create!(title: "Construir UI do Kanban")

done.cards.create!(title: "Instalar Rails e configurar ambiente")
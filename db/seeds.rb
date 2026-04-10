puts "Cadastrando as categorias..."
categories = ["Animais e acessórios",
              "Esportes",
              "Casa",
              "Eletrônicos",
              "Celulares",
              "Infantil",
              "Moda",
              "Beleza",
              "Veículos",
              "Móveis"]

categories.each do |category|
  Category.find_or_create_by(description: category)
end

puts "Categorias cadastradas com sucesso!"
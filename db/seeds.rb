puts "Cadastrando as categorias..."

categories = [
  "Animais e acessórios",
  "Esportes",
  "Casa",
  "Eletrônicos",
  "Celulares",
  "Infantil",
  "Moda",
  "Beleza",
  "Veículos",
  "Móveis"
]

categories.each do |category|
  Category.find_or_create_by!(description: category)
end

puts "Categorias cadastradas com sucesso!"

puts "Garantindo administrador padrão..."

admin = Admin.find_or_initialize_by(email: "camilascholl@hotmail.com")
admin.password = "camila1"
admin.save!

puts "Administrador padrão pronto!"
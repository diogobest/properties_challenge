# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

images = Dir[Rails.root.join("public/images/*.jpg")]

[
  "Bellas Artes Edifício",
  "CEAC Condomínio do Edifício Avenida Central",
  "Chocolate com Pimenta Edifício",
  "Edifício Bolsa do Rio",
  "Edifício Vale do Jardim Atlântico",
  "Condomínio Edifício Fazenda Morumbi",
  "Condomínio Edifício Jatiuca Resort Flat",
  "Condominio Edificio Recanto das Aguas",
  "Edifício 360º Trezentos e Sessenta Graus",
  "Edifício 5G",
  "Edificio Balança Mas Não Cai",
  "Edifício Barra de Itaúna",
  "Edificio Bossa Nova",
  "Edifício Brasil",
  "Edifício Brennand Plaza",
  "Edifício Circuito das Águas São Lourenço",
  "Edifício Colaborativo Eureka",
  "Edifício Coliseu",
  "Edifício Digital",
  "Edifício Ecológico",
  "Edifício Firenze",
  "Edifício Garvey Park Hotel",
  "Edifício Horizonte",
  "Edifício Icon",
  "Edifício Itália",
  "Edifício Inteligente",
  "Edifício Lagoa de Itaúna",
  "Edifício Larus",
  "Edifício Magnific",
  "Edifício Milano",
  "Edifício Notting Hill",
  "Edifício Paraíso",
  "Edifício Paris",
  "Edifício Paulo Brito",
  "Edificio Platinum",
  "Edifício Praia de Itaúna",
  "Edifício Reserva de Itaúna",
  "Edifício Rota do Sol",
  "Edificio Siribeira",
  "Edifício Torre de Marfim",
  "Edifício Varig",
  "Edifício Vila Tatuapé",
  "Edificios Charmosos",
  "EDV - Edifício Della Vita",
  "La Guardia Edifício",
  "Le Grand Edifício",
  "RES - Rôgga Edificios Sustentaveis",
  "Condomínio Jericoacoara",
  "Torre Praia do Cajueiro",
  "Condomínio Edifício Costa do Sol",
  "Condomínio Edifício Praia do Futuro",
  "Condomínio Edifício Porto das Dunas",
  "Condomínio Edifício Vila do Mar",
  "Condomínio Edifício Porto de Galinhas",
  "Condomínio Edifício Ponta Negra",
  "Condomínio Edifício Barra da Lagoa",
  "Condomínio Edifício Praia Brava",
  "Condomínio Edifício Praia do Leste",
  "Condomínio Edifício Praia do Rosa"
].each do |property_name|
  property = Property.find_or_create_by(name: property_name)

  rand(3..5).times do
    image_file = images.sample
    property.photos.attach(io: File.open(image_file),
                           filename: File.basename(image_file))
  end
end

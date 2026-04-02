# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(username: "fkunz") do |user|
  user.first_name = "florian"
  user.last_name = "kunz"
end


Account.find_or_create_by!(iban: "DE02100100100012345678") do |account|
  account.bank_name = "Volksbank Rhein-Nahe-Hunsrück eG"
  account.bic = "PBNKDEFFXXX"
  account.display_name = "Hauptkonto"
  account.opening_balance = 500
  account.user_id = user.id
end

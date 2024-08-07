# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
# Airport.destroy_all
# Flight.destroy_all

# Seed airports
khi = Airport.find_or_create_by!(code: 'KHI')
lyp = Airport.find_or_create_by!(code: 'LYP')
sfo = Airport.find_or_create_by!(code: 'SFO')
nyc = Airport.find_or_create_by!(code: 'NYC')
isb = Airport.find_or_create_by!(code: 'ISB')

# Seed flights
Flight.find_or_create_by!(departure_airport: sfo, arrival_airport: nyc, departure_datetime: '2024-07-01 08:00', duration: 300)
Flight.find_or_create_by!(departure_airport: khi, arrival_airport: isb, departure_datetime: '2024-07-01 09:00', duration: 240)
Flight.find_or_create_by!(departure_airport: isb, arrival_airport: lyp, departure_datetime: '2024-07-01 10:00', duration: 180)
Flight.find_or_create_by!(departure_airport: lyp, arrival_airport: nyc, departure_datetime: '2024-07-01 11:00', duration: 270)
Flight.find_or_create_by!(departure_airport: khi, arrival_airport: sfo, departure_datetime: '2024-07-01 12:00', duration: 210)

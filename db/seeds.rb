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
Airport.destroy_all
Flight.destroy_all

# Seed airports
khi = Airport.create!(code: 'KHI')
lyp = Airport.create!(code: 'LYP')
sfo = Airport.create!(code: 'SFO')
nyc = Airport.create!(code: 'NYC')
isb = Airport.create!(code: 'ISB')

# Seed flights
Flight.create!([
  { departure_airport: sfo, arrival_airport: nyc, departure_datetime: '2024-07-01 08:00', duration: 300 },
  { departure_airport: khi, arrival_airport: isb, departure_datetime: '2024-07-01 09:00', duration: 240 },
  { departure_airport: isb, arrival_airport: lyp, departure_datetime: '2024-07-01 10:00', duration: 180 },
  { departure_airport: lyp, arrival_airport: nyc, departure_datetime: '2024-07-01 11:00', duration: 270 },
  { departure_airport: khi, arrival_airport: sfo, departure_datetime: '2024-07-01 12:00', duration: 210 }
])

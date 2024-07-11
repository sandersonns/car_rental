# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the database"
Booking.destroy_all
Car.destroy_all
User.destroy_all
puts "Database cleaned."

# Manually create renters (users with cars for rent)
renters = [
  {
    email: 'john@example.com',
    password: 'password',
    password_confirmation: 'password',
    cars: [
      {
        brand: 'Toyota',
        model: 'Camry',
        year_of_production: 2018,
        price_per_day: 50.0,
        address: '123 Main St, Springfield'
      },
      {
        brand: 'Honda',
        model: 'Accord',
        year_of_production: 2020,
        price_per_day: 60.0,
        address: '456 Oak St, Springfield'
      }
    ]
  },
  {
    email: 'jane@example.com',
    password: 'password',
    password_confirmation: 'password',
    cars: [
      {
        brand: 'Ford',
        model: 'Focus',
        year_of_production: 2019,
        price_per_day: 45.0,
        address: '789 Pine St, Springfield'
      }
    ]
  },
  {
    email: 'alice@example.com',
    password: 'password',
    password_confirmation: 'password',
    cars: [
      {
        brand: 'Chevrolet',
        model: 'Malibu',
        year_of_production: 2017,
        price_per_day: 55.0,
        address: '321 Elm St, Springfield'
      }
    ]
  },
  {
    email: 'bob@example.com',
    password: 'password',
    password_confirmation: 'password',
    cars: [
      {
        brand: 'Nissan',
        model: 'Altima',
        year_of_production: 2021,
        price_per_day: 65.0,
        address: '654 Maple St, Springfield'
      }
    ]
  },
  {
    email: 'charlie@example.com',
    password: 'password',
    password_confirmation: 'password',
    cars: [
      {
        brand: 'Hyundai',
        model: 'Elantra',
        year_of_production: 2016,
        price_per_day: 40.0,
        address: '987 Cedar St, Springfield'
      }
    ]
  }
]

# Manually create customers (users who only rent cars)
customers = [
  {
    email: 'david@example.com',
    password: 'password',
    password_confirmation: 'password'
  },
  {
    email: 'eve@example.com',
    password: 'password',
    password_confirmation: 'password'
  },
  {
    email: 'frank@example.com',
    password: 'password',
    password_confirmation: 'password'
  },
  {
    email: 'grace@example.com',
    password: 'password',
    password_confirmation: 'password'
  },
  {
    email: 'hank@example.com',
    password: 'password',
    password_confirmation: 'password'
  }
]

# Create renters and their cars
renters.each do |user_data|
  user = User.create!(
    email: user_data[:email],
    password: user_data[:password],
    password_confirmation: user_data[:password_confirmation]
  )
  
  user_data[:cars].each do |car_data|
    user.cars.create!(
      brand: car_data[:brand],
      model: car_data[:model],
      year_of_production: car_data[:year_of_production],
      price_per_day: car_data[:price_per_day],
      address: car_data[:address]
    )
  end
end

# Create customers (no cars)
customers.each do |user_data|
  User.create!(
    email: user_data[:email],
    password: user_data[:password],
    password_confirmation: user_data[:password_confirmation]
  )
end

puts "Seeded #{User.count} users with #{Car.count} cars."

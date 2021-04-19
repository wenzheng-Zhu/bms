# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

User.create(name: "BANK", email: "Bank@bank.com", phone: "11111111111")
User.create(name: "Tom", email: "Tom@111.com", phone: "123123123")
Book.create(title: "Harry Port", sn: SecureRandom.uuid)
Book.create(title: "Love", sn: SecureRandom.uuid)
Book.create(title: "Hello World", sn: SecureRandom.uuid)
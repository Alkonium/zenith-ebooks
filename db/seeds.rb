# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Complete"
OrderStatus.create! id: 3, name: "Cancelled"
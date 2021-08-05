# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r1 = Role.create({ name: 'Doctor' })
r2 = Role.create({ name: 'Patient'})
r3 = Role.create({ name: 'Admin' })

u1 = User.create({ name: 'Sally', email: 'sally@example.com', DOB: Date.new(2000, 9, 17), password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id })
u2 = User.create({ name: 'Sue', email: 'sue@example.com', DOB: Date.new(2001, 9, 17), password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u3 = User.create({ name: 'Kev', email: 'kev@example.com', DOB: Date.new(2002, 9, 17), password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u4 = User.create({ name: 'Jack', email: 'jack@example.com', DOB: Date.new(2003, 9, 17), password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r3.id })
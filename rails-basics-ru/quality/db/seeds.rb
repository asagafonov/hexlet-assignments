# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |index|
  bulletin_index = index + 1
  Bulletin.create(
    title: "Bulletin #{bulletin_index}",
    body: "Body #{bulletin_index}",
    published: [true, false].sample
  )
end

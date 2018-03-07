# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Cat.destroy_all
CatRentalRequest.destroy_all
100.times do
    Cat.create({color: ['black', 'white', 'tabby', 'orange'].sample,
      name: Faker::Name.first_name,
      sex: ['M', 'F'].sample,
      birth_date: Faker::Date.between(10.years.ago, 1.year.ago),
      description: Faker::StarWars.quote})
end

CatRentalRequest.create(cat_id: 1,
  start_date: '2017/01/01',
  end_date: '2017/02/01'
)

CatRentalRequest.create(cat_id: 1,
  start_date: '2017/01/08',
  end_date: '2017/02/01'
)

CatRentalRequest.create(cat_id: 1,
  start_date: '2017/03/01',
  end_date: '2017/04/01'
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types = ["カルバート類", "管渠・暗渠類", "側溝類", "道路類", "擁壁類", "水路類", "残存型枠類", "河川・港湾類", "周辺事業", "その他"]
types.each do |type|
  Type.create(name: type)
end
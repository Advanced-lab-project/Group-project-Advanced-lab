Category.destroy_all

puts "Seeding categories..."
computing   = Category.create!(name: "Computing")
optics      = Category.create!(name: "Optics")
networking  = Category.create!(name: "Networking")
electronics = Category.create!(name: "Electronics")

puts "  Categories:          #{Category.count}"
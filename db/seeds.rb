puts "Clearing existing data..."
MaintenanceRecord.destroy_all
Equipment.destroy_all
Category.destroy_all

puts "Seeding categories..."
computing   = Category.create!(name: "Computing")
optics      = Category.create!(name: "Optics")
networking  = Category.create!(name: "Networking")
electronics = Category.create!(name: "Electronics")

puts "Seeding equipment..."
laptop1 = Equipment.create!(
  name: "Dell Latitude Laptop",
  serial_number: "LAP-001",
  status: "available",
  category: computing
)
laptop2 = Equipment.create!(
  name: "MacBook Pro",
  serial_number: "LAP-002",
  status: "in_use",
  category: computing
)
micro1 = Equipment.create!(
  name: "Binocular Microscope",
  serial_number: "MIC-001",
  status: "maintenance",
  category: optics
)
micro2 = Equipment.create!(
  name: "Digital Microscope",
  serial_number: "MIC-002",
  status: "available",
  category: optics
)
router1 = Equipment.create!(
  name: "Cisco Router",
  serial_number: "RTR-001",
  status: "available",
  category: networking
)
Equipment.create!(
  name: "Network Switch 24P",
  serial_number: "SWT-001",
  status: "in_use",
  category: networking
)
Equipment.create!(
  name: "Arduino Uno Kit",
  serial_number: "ARD-001",
  status: "available",
  category: electronics
)
osc1 = Equipment.create!(
  name: "Oscilloscope",
  serial_number: "OSC-001",
  status: "maintenance",
  category: electronics
)

puts "Seeding maintenance records..."
MaintenanceRecord.create!(
  description: "Replaced thermal paste and cleaned fans",
  performed_at: 3.weeks.ago,
  equipment: laptop1
)
MaintenanceRecord.create!(
  description: "Calibrated lens and cleaned optical surfaces",
  performed_at: 2.weeks.ago,
  equipment: micro1
)
MaintenanceRecord.create!(
  description: "Firmware update and port inspection",
  performed_at: 10.days.ago,
  equipment: router1
)
MaintenanceRecord.create!(
  description: "Replaced objective lens",
  performed_at: 5.days.ago,
  equipment: micro1
)
MaintenanceRecord.create!(
  description: "Replaced probe tips and recalibrated display",
  performed_at: 1.day.ago,
  equipment: osc1
)

puts ""
puts "Seed complete!"
puts "  Categories:          #{Category.count}"
puts "  Equipment:           #{Equipment.count}"
puts "  Maintenance Records: #{MaintenanceRecord.count}"

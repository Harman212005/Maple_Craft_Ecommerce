

Province.destroy_all()




require 'csv'

csv_file = Rails.root.join('data', 'provinces.csv')

puts "Seeding provinces from #{csv_file}..."

CSV.foreach(csv_file, headers: true) do |row|
  Province.find_or_create_by!(name: row['name']) do |province|
    province.gst = row['gst']
    province.pst = row['pst']
    province.hst = row['hst']
    province.created_at = Time.now
    province.updated_at = Time.now
  end
end

puts "✅ Provinces seeded successfully!"




Page.find_or_create_by(name: "about") do |page|
  page.about_us = "We are a customer-centric e-commerce platform focused on trust and quality."
  page.our_story = "Our journey began with a passion for making online shopping easy for everyone."
  page.mission = "Deliver value and delight to every customer."
  page.values = "Integrity, Customer First, Global Reach"
end

Page.find_or_create_by(name: "contact") do |page|
  page.phone = "+91-9876543210"
  page.email = "contact@yourstore.com"
  page.instagram = "@yourstoreofficial"
  page.address = "123, Main Road, YourCity, Country"
end





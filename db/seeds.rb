require 'faker'

# Clear old data
Product.destroy_all
Category.destroy_all

# Local-themed categories
category_names = [
  "Handwoven Textiles",
  "Local Spices & Condiments",
  "Handmade Pottery",
  "Traditional Jewelry",
  "Wooden Handicrafts",
  "Bamboo & Cane Products",
  "Folk Art Paintings",
  "Organic Skincare",
  "Herbal Teas",
  "Brass & Metal Works"
]

categories = category_names.map do |name|
  Category.create!(
    name: name,
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "✅ Created #{categories.count} categories."

# Local product name pools
materials = [
  "Bamboo", "Terracotta", "Handwoven Cotton", "Silk", "Cane", "Brass",
  "Neem", "Sandalwood", "Copper", "Clay", "Organic Jute", "Wool"
]

products = [
  "Tea Set", "Serving Bowl", "Wall Hanging", "Jewelry Box", "Table Runner",
  "Cushion Cover", "Masala Mix", "Face Cream", "Hand Fan", "Spice Grinder",
  "Oil Lamp", "Storage Basket", "Shawl", "Mug Set", "Herbal Soap"
]

# Create 100 products
100.times do
  category = categories.sample
  title = "#{materials.sample} #{products.sample}"
  Product.create!(
    title: title,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    price: Faker::Commerce.price(range: 5.0..500.0),
    on_sale: Faker::Boolean.boolean(true_ratio: 0.3),
    category_id: category.id,
    stock: Faker::Number.between(from: 5, to: 50),
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "✅ Created 100 local products."



require 'csv'

# Import Categories
categories_file = Rails.root.join('data', 'new_categories.csv')
puts "Importing categories from #{categories_file}..."

CSV.foreach(categories_file, headers: true) do |row|
  Category.create!(
    id: row['id'],
    name: row['name'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

puts "✅ Imported Categories"

# Import Products
products_file = Rails.root.join('data', 'new_products.csv')
puts "Importing products from #{products_file}..."

CSV.foreach(products_file, headers: true) do |row|
  Product.create!(
    id: row['id'],
    title: row['title'],
    description: row['description'],
    price: row['price'],
    on_sale: row['on_sale'] == 'true',
    category_id: row['category_id'],
    stock: row['stock'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

puts "✅ Imported Products"


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





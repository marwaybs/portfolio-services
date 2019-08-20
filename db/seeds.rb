require 'colorize'

puts '-- Seeds started --'.white.on_green.bold

lists = {
  model: List,
  data: [
    { title: 'Strawberry', excerpt: 'Often covered in chocolate', description: 'A large red berry', upvotes: 2 },
    { title: 'Cake', excerpt: 'Comes in many flavours', description: 'A baked dessert', upvotes: 5 },
  ]
}

@seeds = [
  lists
]

@seeds.each do |seed|
  seed[:data].each do |x|
    seed[:model].find_or_create_by(x)
  end
  puts "Sucessfully Seeded [#{seed[:model]}]".green
end

puts '-- Seeds finished --'.white.on_green.bold

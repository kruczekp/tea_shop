# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tea_colors = %w{black blue red yellow green}
tea_names = %w{delight brew touch sip essence}
desc = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempor commodo fringilla. Nullam aliquet sem eget laoreet ullamcorper. Pellentesque eros velit, pretium id nisi id, ultrices eleifend quam. Quisque sed volutpat nisi. In at est mi. Phasellus fringilla tempor dignissim. Nam ut aliquet libero. In hac habitasse platea dictumst. In maximus porttitor purus non dapibus. Maecenas eleifend tempus felis, in tincidunt ex venenatis in. Mauris tincidunt tellus elit, et blandit elit ultrices non. Proin at risus sollicitudin, vehicula elit at, consequat libero. Praesent dictum vehicula eleifend. Nunc hendrerit sit amet neque sit amet semper.'

50.times do |i|
  Tea.create(
    price: 2+rand(15)+rand,
    name: "#{tea_colors.sample.capitalize} #{tea_names.sample.capitalize}",
    quantity: 3+rand(10),
    created_at: Time.now - rand(50).hours,
    description: desc
  )
end
# Create a member
member = User.new(
  name:     'Norman Maclean',
  email:    'norm@hauntedbywaters.net',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

10.times do
  member = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
  )
end
member.skip_confirmation!
member.save!

50.times do
  application = RegisteredApplication.new(
    name: Faker::Company.name,
    url: Faker::Internet.url
)
end

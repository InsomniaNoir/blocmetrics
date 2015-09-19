# Create a member
member = User.new(
  name:     'Norman Maclean',
  email:    'norm@hauntedbywaters.net',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

10.times do
  member = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
  )
end
member.skip_confirmation!
member.save!

50.times do
  application = RegisteredApplication.create!(
    name: Faker::Company.name,
    url: Faker::Internet.url
)
end
applications = RegisteredApplication.all

100.times do
  event = Event.create!(
    event_name: Faker::Company.name,
    url: Faker::Internet.domain_name,
    ip_address: Faker::Internet.ip_v4_address,
    registered_application: applications.sample
  )
end
events = Event.all

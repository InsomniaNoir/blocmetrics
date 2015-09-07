# Create a member
member = User.new(
  name:     'Norman Maclean',
  email:    'norm@hauntedbywaters.net',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

# 1000.times do 
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name

#   contact = Contact.new(
#                         first_name: first_name,
#                         middle_name: Faker::Name.middle_name,
#                         last_name: last_name,
#                         email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
#                         phone_number: Faker::PhoneNumber.phone_number,
#                         bio: Faker::Hacker.say_something_smart
#                         )
#   contact.save
# end

# 100.times do 
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#     user = User.new(
#       name: "#{first_name} #{last_name}",
#       email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
#       password: "password",
#       password_confirmation: "password"
#     )
#   user.save
# end


# contact = Contact.all
# contact.user_id = 1
# contact.save

# list = Contact.all.pluck(:id)
# list.each do |id|
#   contact = Contact.find(id)
#   contact.user_id = rand(1..101)
#   contact.save
# end

# ContactGroup.create(contact_id: 24, group_id: 1)
# ContactGroup.create(contact_id: 24, group_id: 3)
# ContactGroup.create(contact_id: 71, group_id: 3)
# ContactGroup.create(contact_id: 71, group_id: 2)
# ContactGroup.create(contact_id: 172, group_id: 9)
# ContactGroup.create(contact_id: 472, group_id: 1)
# ContactGroup.create(contact_id: 472, group_id: 2)
# ContactGroup.create(contact_id: 472, group_id: 3)
# ContactGroup.create(contact_id: 875, group_id: 10)
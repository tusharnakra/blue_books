# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RequestAccess.create(subject: "Blue Book 5", description: "Requesting read access to blue book #5")
RequestAccess.create(subject: "Complete read access", description: "Requesting read access to all blue books")
RequestAccess.create(subject: "Blue Book 7", description: "Requesting edit Access to blue book #7")


email_group_1 = EmailGroup.create(name: "Email Group 1")
email_group_2 = EmailGroup.create(name: "Email Group 2")
email_group_3 = EmailGroup.create(name: "Email Group 3")


EmailAddress.create(name: "ntushar@seas.upenn.edu", email_group_id: email_group_1.id)
EmailAddress.create(name: "adid@seas.upenn.edu", email_group_id: email_group_1.id)
EmailAddress.create(name: "shallav@seas.upenn.edu", email_group_id: email_group_2.id)
EmailAddress.create(name: "shallav.varma@gmail.com", email_group_id: email_group_2.id)
EmailAddress.create(name: "adid.desh@gmail.com", email_group_id: email_group_3.id)
EmailAddress.create(name: "tusharnakra@hotmail.com", email_group_id: email_group_3.id)

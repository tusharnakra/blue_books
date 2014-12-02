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


email_group_0 = Group.create(name: "Admin")
email_group_1 = Group.create(name: "Email Group 1")
email_group_2 = Group.create(name: "Email Group 2")


school_1 = School.create(name: "SEAS")
school_2 = School.create(name: "Wharton")
school_3 = School.create(name: "SAS")


Member.create(email_address: "ntushar@seas.upenn.edu", first_name: "Tushar", last_name: "Nakra" , pennkey: "tusharn", school_id: school_1.id, group_id: email_group_1.id)
Member.create(email_address: "adid@seas.upenn.edu", first_name: "Aditya", last_name: "Deshpande" , pennkey: "adid", school_id: school_1.id, group_id: email_group_0.id)
Member.create(email_address: "shallav@seas.upenn.edu", first_name: "Shallav", last_name: "Varma" , pennkey: "shallav", school_id: school_1.id, group_id: email_group_0.id)
Member.create(email_address: "anil@wharton.upenn.edu", first_name: "Anil", last_name: "Ambani" , pennkey: "anil", school_id: school_2.id, group_id: email_group_1.id)
Member.create(email_address: "albert@sas.upenn.edu", first_name: "Albert", last_name: "Einstein" , pennkey: "albert", school_id: school_3.id, group_id: email_group_2.id)
Member.create(email_address: "steve@wharton.upenn.edu", first_name: "Steve", last_name: "Jobs" , pennkey: "steve", school_id: school_2.id, group_id: email_group_2.id)

Book.create(name: "Homework 3", attachment: File.open(File.join(Rails.root,"public/app/assets/hw3.pdf")))
Book.create(name: "Levine", attachment: File.open(File.join(Rails.root,"public/app/assets/Levine.pdf")))
Book.create(name: "Towne",  attachment: File.open(File.join(Rails.root,"public/app/assets/Towne.pdf")))
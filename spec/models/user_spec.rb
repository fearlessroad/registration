require 'rails_helper'

RSpec.describe User, type: :model do
 it "should require that the email be in a valid format" do
 	user = User.new(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"flabsfdjsghag", 
 			password:"pooppoop",
 			password_confirmation:"pooppoop")
 	expect(user).to be_invalid
 end 
 it "should require the presence of first name, last name, email, and password" do
 	user1 = User.new(
 			first_name:"", 
 			last_name:"Bob", 
 			email:"abby@abby.com", 
 			password:"pooppoop",
 			password_confirmation:"pooppoop")
 	expect(user1).to be_invalid
 	user2 = User.new(
 			first_name:"Abby", 
 			last_name:"", 
 			email:"abby@abby.com", 
 			password:"pooppoop",
 			password_confirmation:"pooppoop")
 	expect(user2).to be_invalid
  	user3 = User.new(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"", 
 			password:"pooppoop",
 			password_confirmation:"pooppoop")
 	expect(user3).to be_invalid
 	user4 = User.new(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"abby@abby.com", 
 			password:"",
 			password_confirmation:"pooppoop")
 	expect(user4).to be_invalid
 	user5 = User.new(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"abby@abby.com", 
 			password:"pooppoop",
 			password_confirmation:"")
 	expect(user5).to be_invalid
 	user6 = User.new(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"abby@abby.com", 
 			password:"pooppoop",
 			password_confirmation:"pooppoop")
 	expect(user6).to be_valid
 end
 it "should require a unique email" do
  	User.create(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"abby@abby.com", 
 			password:"pooppoop",
 			password_confirmation:"pooppoop")
 	user = User.new(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"abby@abby.com", 
 			password:"pooppoop",
 			password_confirmation:"pooppoop")
 	expect(user).to be_invalid
 end

 it "should require the password to be at least 6 characters" do
 	user = User.new(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"abby@abby.com", 
 			password:"poop",
 			password_confirmation:"poop")
 	expect(user).to be_invalid
 	user1 = User.new(
 			first_name:"Abby", 
 			last_name:"Bob", 
 			email:"abby@abby.com", 
 			password:"pooppoop",
 			password_confirmation:"pooppoop")
 	expect(user1).to be_valid
 end
end

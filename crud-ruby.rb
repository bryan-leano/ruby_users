require 'httparty'
require 'json'
require 'pry'

BASE_URL = "http://json-server.devpointlabs.com/api/v1"

users = HTTParty.get("#{BASE_URL}/users").parsed_response

def menu
  puts "Hello! Welcome to Ruby users!"
  puts "Please select a choice!"
  puts "1) See all users
2) See one user
3) Add a user 
4) Update a user
5) Delete a user
6) Quit"
selection
end

def selection
  choice = gets.chomp.to_i
    if choice == 1
      all_users
    elsif choice == 2 
      one_user
    elsif choice == 3
      add_user
    elsif choice == 4
      update_user
    elsif choice == 5
      delete_user
    elsif choice == 6
      quit
    end
end

def all_users
  users = HTTParty.get("#{BASE_URL}/users").parsed_response

  users.each do |user|
    puts user['id']
    puts user['first_name']
    puts user['last_name']
    puts user['phone_number']
  end
end

def one_user
  users = HTTParty.get("#{BASE_URL}/users").parsed_response

  puts "What is the first name of the person you want to see?"
  name = gets.chomp.to_s
  puts users.match['first_name']
  menu
end

def add_user
  puts "add_user"
  menu
end

def update_user
  puts "update_user"
  menu
end

def delete_user
  puts "delete_user"
  menu
end

def quit
  puts "Goodbye!"
  exit
end

menu
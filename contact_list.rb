require 'pg'
require_relative 'contact'
require_relative 'contact_database'
require 'pry'



# TODO: Implement command line interaction
# This should be the only file where you use puts and gets


# puts "Welcome to contact list, you chose option: #{ARGV[0]}"

# chosen_option = ARGV[0]

# def menu
#   puts "Here is a list of available commands:"
#   puts "\tnew - Create a new contact"
#   puts "\tlist - List all contacts"
#   puts "\tshow = Show a contact"
#   puts "\tfind - Find a contact"
# end


# case chosen_option
#   when 'help'
#     # returns the menu option
#     menu
#   when 'new'
#     # list all contacts from csv
#     puts "What is your first name?"
#     first_name = STDIN.gets.chomp
#     puts "What is your last name?"
#     last_name = STDIN.gets.chomp
#     puts "What is your email address?"
#     email = STDIN.gets.chomp
#     contact = Contact.create(first_name, last_name, email)
#   when 'list'
#     Contact.all

#   when 'show'
#     puts "What is the id of the contact that you're looking for?"
#     id = ARGV[1]
#     Contact.show(id)


#     # display a list of all contacts within the app, printed one on each line.
#   # when 'show'(id)
#     # command along with an id (index) of the contact, the app should display their details. If a 
#     # contact with that index/id is found,  display their details, with each field being printed on an individual line. If
#     # the contact cannot be found, display a custom "not found" message.
    
#   when 'find'
#    search
#     # the app will search through the names of the contacts and print the contact details 
#     # of any contacts which have the search term contained within their name or email. (ie. 
#     #   the search term is a substring of the contact’s email or name)
        
# end
  
new_contact = Contact.find("9")
new_contact.destroy
# puts Contact.find_all_by_lastname("Agassi")
# puts Contact.find_all_by_firstname("Greg")
# puts Contact.find_by_email("roger@federer.com")
# puts Contact.destroy("9")
# new_contact = Contact.new("Chris", "Froome", "chris@froome.com")
# new_contact.save
# puts Contact.find_all_by_lastname("Froome")
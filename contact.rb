# require_relative 'contact_database'


class Contact
 
  attr_accessor :first_name, :last_name, :email, :id
  CONN = PG::Connection.new(host: 'localhost', port: 5432, dbname: 'orm', user: 'development', password: 'development')

  

  def initialize(first_name, last_name, email, id=0)
    # TODO: assign local variables to instance variables
    @first_name = first_name
    @last_name = last_name
    @email = email
    @id = id if id.to_i > 0
  end
 
  # def to_s
  #   # TODO: return string representation of Contact
  #   "#{@id}: #{@first_name} #{@last_name} (#{@email})"
  # end
 
  # ## Class Methods
  # class << self
    
  #   def create(first_name, last_name, email)
  #     # TODO: Will initialize a contact as well as add it to the list of contacts
  #     contact = Contact.new(first_name, last_name, email)
  #     ContactDatabase.write_to_touch_contacts_csv(contact)
  #     return contact
  #   end
 
  #   def find(term)
  #     # TODO: Will find and return contacts that contain the term in the first name, last name or email
  #     contacts = Contact.csv_to_array_of_contacts
  #     contacts.each do | contact |
  #       # new method for each search option and then return results of those 3 (or 4) methods in "find"
  #       # if first_name == contact.first_name || last_name == contact.last_name || email 
  #   end
 
  #   def csv_to_array_of_contacts
  #     contacts = []
  #     contact_array = ContactDatabase.get_contacts_from_csv
  #     contact_array.each do | row | 
  #       id = row[0]
  #       first_name = row[1]
  #       last_name = row[2]
  #       email = row[3]
  #       contact = Contact.new(first_name, last_name, email)
  #       contact.id = id
  #       contacts << contact
  #     end
  #     return contacts
  #   end
    
  #   def all
  #     contacts = Contact.csv_to_array_of_contacts
  #     contacts.each do | contact |
  #       puts contact
  #     end
  #     puts "----------------------------------------------"
  #     puts "#{contacts.length} records total"
  #     # TODO: Return the list of contacts, as is
  #   end
    
  #   def show(id)
  #     contacts = Contact.csv_to_array_of_contacts
  #     contacts.each do | contact |
  #       if id == contact.id
  #         puts contact
  #       end
  #     # TODO: Show a contact, based on ID
  #     end
  #   end
    
  #   def search(term)
  #     #TODO: find a contact based on the search term
  #   end  
  
  # end
 
 # METHODS TO CONNECT TO THE DATABASE
  # def self.new(firstname, lastname, email)
  #   # The constructor / initializer. Used to represent a contact instance in memory. Does not talk to the database
  #   new_contact = Contact.new(firstname, lastname, email)
  # end

  def save
     # Either inserts or updates a row in the database, as necessary for the given instance of contact.
    # Ask yourself / discuss: When save is called, how will it know whether to run an INSERT or UPDATE SQL statement?

    if @id
      query_update = "UPDATE contacts SET firstname = '#{first_name}', lastname = '#{last_name}', email = '#{email}'"  
      CONN.exec(query_update)
    else
      query_insert = "INSERT INTO contacts (firstname, lastname, email) VALUES ('#{first_name}', '#{last_name}', '#{email}') RETURNING id;"
      results = CONN.exec(query_insert)
      @id = results[0]["id"]
    end
  end

  def destroy
    # Executes a DELETE SQL command against the database.
    # Ask yourself / discuss: What will it need to provide the database as part of the DELETE SQL statement?
    query_delete = "DELETE FROM contacts WHERE id=#{id};"
    result = CONN.exec(query_delete)
  end

  def self.find(id)
    # A class method to SELECT a contact row from the database by id and return a Contact instance that represents ("maps to") that row.
    c = nil
    query_find = "SELECT * FROM contacts WHERE id=#{id};"
      result = CONN.exec(query_find)
      result.each do |contact|
        c = self.new(contact["firstname"], contact["lastname"], contact["email"], contact["id"])
      puts "The contact details are First Name: #{c.first_name} Last Name: #{c.last_name} Email: #{c.email}"
    end
   c
  end

  def self.find_all_by_lastname(lastname)
    # Another class method, but this one returns an array of all contacts that have the provided last name. If none are found, 
    # an empty array should be returned.
    # It will do an exact string match.
    query_lastname = "SELECT * FROM contacts WHERE lastname = \'#{lastname}\';"
    result = CONN.exec(query_lastname)
      result.each do |contact|
        l = Contact.new(contact["firstname"], contact["lastname"], contact["email"], contact["id"])
        puts "The contact details are First Name: #{l.first_name} Last Name: #{l.last_name} Email: #{l.email}"
     end
  end

  def self.find_all_by_firstname(firstname)
    # Another class method, but this one returns an array of all contacts that have the provided first name. If none are found, 
    # an empty array should be returned.
    # It will do an exact string match.
    query_firstname = "SELECT * FROM contacts WHERE firstname= \'#{firstname}\';"
    result = CONN.exec(query_firstname)
      result.each do |contact|
        f = Contact.new(contact["firstname"], contact["lastname"], contact["email"], contact["id"])
        puts "The contact details are First Name: #{f.first_name} Last Name: #{f.last_name} Email: #{f.email}"
     end
  end

  def self.find_by_email(email)
    # Almost identical to the other two methods above. However, since emails are assumed to be unique, we return only a single 
    # record (or nil) here. Hence why we use find_by_ instead of find_all_by for this method name.
    query_email = "SELECT * FROM contacts WHERE email= \'#{email}\';"
    result = CONN.exec(query_email)
      result.each do |contact|
        e = Contact.new(contact["firstname"], contact["lastname"], contact["email"], contact["id"])
        puts "The contact details are First Name: #{e.first_name} Last Name: #{e.last_name} Email: #{e.email}"
     end
  end









end
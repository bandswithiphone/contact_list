## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  class << self


    def write_to_touch_contacts_csv(contact)
      CSV.open("touch_contacts.csv", "a") do |csv|
        csv << [contact.id, contact.first_name, contact.last_name, contact.email]
      end
    end

    def get_contacts_from_csv
      contact_array = []
      CSV.foreach("touch_contacts.csv") do |row|
        contact_array << row
      end
      return contact_array
    end


  end
end

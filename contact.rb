require 'csv'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly

class Contact 

  attr_accessor :id, :name, :email
  
  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end

  # Provides functionality for managing contacts in the csv file.
  class << self

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      contacts_array = []
      CSV.foreach('contacts.csv') do |row|
        contacts_array << Contact.new(row[0], row[1], row[2])
      end
      contacts_array
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    def create(name, email)
      id = CSV.read('contacts.csv').last[0].to_i + 1
      new_contact = Contact.new(id, name, email)
      CSV.open('contacts.csv', 'a') do |file|
        file << [new_contact.id, new_contact.name, new_contact.email]
      end
      new_contact
    end
    
    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
    
# TODO: Find the Contact in the 'contacts.csv' file with the matching id.
    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    end

  end

end

require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  

  command = ARGV[0]
  case command

    when "new"

    when "list"
      contacts = Contact.all
      contacts.each do |contact|
        puts "#{contact.id}: #{contact.name} (#{contact.email})"
      end
      puts "---\n#{contacts.length} records total"


    when "show"

    when "search"
    else
      puts "Here is a list of available commands:"
      puts "new - Create a new contact"
      puts "list - List all contacts"
      puts "show - Show a contact"
      puts "search - Search contacts"

  end 

end



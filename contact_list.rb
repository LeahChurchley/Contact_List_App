require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  command = ARGV[0]
  case command

    when "new"
      puts "What is your full name?"
      full_name = STDIN.gets.chomp
      puts "What is your email?"
      email_answer = STDIN.gets.chomp
      new_contact = Contact.create(full_name, email_answer)
      puts "#{full_name} #{email_answer}, you have successfully created a new contact."

    when "list"
      contacts = Contact.all
      contacts.each do |contact|
        puts "#{contact.id}: #{contact.name} (#{contact.email})"
      end
      puts "---\n#{contacts.length} records total"

    when "show"
      display_found_contact = Contact.find(ARGV[1])
      if Contact.find(ARGV[1])
        puts "#{display_found_contact.name}\n#{display_found_contact.email}"
      else
        puts "Contact #{ARGV[1]} not found."
      end


    when "search"


    else
      puts "Here is a list of available commands:"
      puts "new - Create a new contact"
      puts "list - List all contacts"
      puts "show - Show a contact"
      puts "search - Search contacts"
  end 

end



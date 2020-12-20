require_relative '../models/address_book'
require 'csv'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Please select from below options"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Import entries from a CSV"
    puts "4 - Exit"
    print "Enter your selection: "
    selection = gets.to_i 
    puts "You picked #{selection}"
    case selection
      when 1
        
        view_all_entries
        main_menu
      when 2
        
        create_entry
        main_menu
      when 3
        
        read_csv
        main_menu
      when 4
        puts "Good-bye!"
        exit(0)
      else  # Catch invalid user input and proper user to retry.
        # system "clear"
        puts "Sorry, that is not a valid input."
        main_menu
    end
  end

  def view_all_entries
    begin
    CSV.foreach('new_entries.csv') do |row|
      puts row.inspect
    end
    rescue
      puts "please add the first entry"

    end
  end

  def create_entry
    puts "New AddressBlock Entry"
    print "Name:"
    name = gets.chomp # Chomp deletes the new line at the end of a user input.
    print "Phone Number:"
    phone_number = gets.chomp
    print "Email:"
    email = gets.chomp
    address_book.add_entry(name, phone_number, email)
    # system "clear"
    puts "Entry created for #{name}."
  end


  def read_csv
    print "Enter the name of the file you would like to upload: "
    file_name = gets.chomp
    if file_name.empty?
      # system "clear"
      puts "CSV file not found."
      main_menu
    end
    begin
      entry_count = address_book.import_from_csv(file_name).count
      # system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV"
      read_csv
    end
  end

end

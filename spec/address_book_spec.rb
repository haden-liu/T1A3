require_relative '../models/address_book'
require 'csv'

RSpec.describe AddressBook do
    let(:book) { AddressBook.new }
  
    describe "attributes" do
      it "responds to entries" do
        expect(book).to respond_to(:entries)
      end
      it "initializes entries as an array" do
        expect(book.entries).to be_an(Array)
      end
      it "initialies entries as empty" do
        expect(book.entries.size).to eq(0)
      end
    end

    describe "#add_entry" do
        it "adds one entry to address book" do
          book.add_entry('Haden Liu', '043.575.1307', 'haden.liu30@gmail.com')
          expect(book.entries.size).to eq(1)
        end
        it "adds the correct information to the entries" do
          book.add_entry('Haden Liu', '043.575.1307', 'haden.liu30@gmail.com')
          new_entry = book.entries[0]
          expect(new_entry.name).to eq('Haden Liu')
          expect(new_entry.phone_number).to eq('043.575.1307')
          expect(new_entry.email).to eq('haden.liu30@gmail.com')
        end
      end
    
      def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
      end


end
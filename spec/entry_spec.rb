require_relative '../models/entry'

RSpec.describe Entry do
    # 'describe' lists the attributes we want to test.
    describe "attributes" do
      let(:entry) { Entry.new('Haden Liu', '043.575.1307', 'haden.liu30@gmail.com')}
      # Separate out individual tests with 'it' method.
      it "responds to name" do
        expect(entry).to respond_to(:name)
      end
      it "returns correct name" do
        expect(entry.name).to eq('Haden Liu')
      end
      it "responds to phone number" do
        expect(entry).to respond_to(:phone_number)
      end
      it "returns correct phone number" do
        expect(entry.phone_number).to eq('043.575.1307')
      end
      it "responds to email" do
        expect(entry).to respond_to(:email)
      end
      it "returns correct email" do
        expect(entry.email).to eq('haden.liu30@gmail.com')
      end
  
    end
  
    describe "#to_s" do
      it "prints entry as string" do
        entry = Entry.new('Haden Liu', '043.575.1307', 'haden.liu30@gmail.com')
        expected_string = "Name: Haden Liu \nPhone Number: 043.575.1307 \nEmail: haden.liu30@gmail.com"
        expect(entry.to_s).to eq(expected_string)
      end
    end
  
  end

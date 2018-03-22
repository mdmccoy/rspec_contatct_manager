require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) do
    Person.new(first_name:"Alice", last_name:"Smith")
  end

  it 'person is valid' do
    expect(person).to be_valid
  end

  it "is invalid without first_name" do
    # person = Person.new(first_name: nil, last_name:nil)
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it "is invalid without last_name" do
    # person =  Person.new(last_name: nil, first_name: "Jane")
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it "has many phone numbers" do
    expect(person.phone_numbers).to eq([])
  end
end

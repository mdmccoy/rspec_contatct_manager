require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) {Person.new(first_name:"Alice", last_name:"Smith")}

  it 'person is valid' do
    expect(person).to be_valid
  end

  it "is invalid without first_name" do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it "is invalid without last_name" do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it "has many phone numbers" do
    expect(person.phone_numbers).to eq([])
  end

  it "has an email address" do
    expect(person.email_addresses).to eq([])
  end
end

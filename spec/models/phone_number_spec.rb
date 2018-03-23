require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:person) do
    Person.create(first_name:"Alice", last_name:"Smith")
  end

  let(:phone_number) do
    PhoneNumber.new(person: person, number:"1112223333")
  end

  it "is valid" do
    expect(phone_number).to be_valid
  end

  it "is invalid without a number" do
    phone_number.number =  nil
    expect(phone_number).to_not be_valid
  end

  it "must have a reference to a person" do
    phone_number.person = nil
    expect(phone_number).not_to be_valid
  end

end

require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person){Person.create(first_name: "Alice", last_name:"Smith")}
  let(:email_address) {EmailAddress.new(person:person,address: "alice@smith.com")}

  it "is valid" do
    expect(email_address).to be_valid
  end

  it "is is invalid without an address" do
    email_address.address =  nil

    expect(email_address).to_not be_valid
  end

  it "is invalid without a person" do
    email_address.person = nil

    expect(email_address).to_not be_valid
  end
end

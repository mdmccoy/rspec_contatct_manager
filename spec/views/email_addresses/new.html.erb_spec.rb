require 'rails_helper'

RSpec.describe "email_addresses/new", type: :view do
  let(:person) {Person.create(first_name:"Alice", last_name:"Smith")}
  let(:email_address) {EmailAddress.create(contact_id:person.id, contact_type:person.class, address:"alice@smith.com")}

  before(:each) do
    assign(:email_address, email_address)
  end
  it "shows the contacts name in the title" do
    render
    assert_select("h1", text: "New Email Address for #{email_address.contact}")
  end
end

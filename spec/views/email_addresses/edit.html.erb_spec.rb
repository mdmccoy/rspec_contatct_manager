require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  let(:person){Person.create(first_name: "Alice", last_name:"Smith")}
  let(:email_address) {EmailAddress.create(contact_id:person.id, contact_type:person.class, address:"alice@smith.com")}

  before(:each) do
    assign(:email_address, email_address)
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(email_address), "post" do

      assert_select "input[name=?]", "email_address[address]"

      assert_select "input[name=?]", "email_address[contact_id]"
    end
  end

  it "shows the contacts name in the title" do
    render

    assert_select("h1", text: "Editing email address for #{email_address.contact}")
  end
end

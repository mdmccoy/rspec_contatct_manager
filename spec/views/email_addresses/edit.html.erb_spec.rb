require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  let(:person){Person.create(first_name: "Alice", last_name:"Smith")}

  before(:each) do
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "MyString",
      :contact => person
    ))
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(@email_address), "post" do

      assert_select "input[name=?]", "email_address[address]"

      assert_select "input[name=?]", "email_address[contact_id]"
    end
  end
end

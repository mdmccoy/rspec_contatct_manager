require 'rails_helper'

RSpec.describe "email_addresses/new", type: :view do
  let(:contact){ Company.create(name:"Test Co.")}
  before(:each) do
    assign(:email_address, EmailAddress.new(
      :address => "MyString",
      :contact => contact
    ))
  end

  it "renders new email_address form" do
    render

    assert_select "form[action=?][method=?]", email_addresses_path, "post" do

      assert_select "input[name=?]", "email_address[address]"

      assert_select "input[name=?]", "email_address[contact_id]"
    end
  end
end

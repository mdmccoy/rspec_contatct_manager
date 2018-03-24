require 'rails_helper'

RSpec.describe "email_addresses/index", type: :view do
  let(:person){Person.create(first_name: "Alice", last_name:"Smith")}

  before(:each) do
    assign(:email_addresses, [
      EmailAddress.create!(
        :address => "Address",
        :person => person
      ),
      EmailAddress.create!(
        :address => "Address",
        :person => person
      )
    ])
  end

  it "renders a list of email_addresses" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => person.to_s, :count => 2
  end
end

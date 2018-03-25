require 'rails_helper'

RSpec.describe "email_addresses/show", type: :view do
  let(:person){Person.create(first_name: "Alice", last_name:"Smith")}

  before(:each) do
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "Address",
      :contact => person
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(//)
  end
end

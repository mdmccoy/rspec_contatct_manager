require 'rails_helper'

RSpec.describe 'phone_numbers/new', type: :view do
  let(:person){Person.create(first_name: "Alice", last_name:"Smith")}
  let(:phone_number) {PhoneNumber.create(contact_id:person.id, contact_type:person.class, number:"111-222-3333")}

  before(:each) do
    assign(:phone_number, phone_number)
  end

  it "shows the contacts name in the header" do
    render

    assert_select("h1", text: "New phone number for #{phone_number.contact}")
  end
end

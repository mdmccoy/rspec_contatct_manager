require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  let(:contact) do
    Person.create(first_name:"Alice", last_name:"Smith")
  end

  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => "Number",
      :contact_id => contact.id,
      :contact_type => contact.class
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(//)
  end
end

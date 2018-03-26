require 'rails_helper'

RSpec.describe 'phone_numbers/edit', type: :view do
  let(:person){Person.create(first_name: "Alice", last_name:"Smith")}
  let(:phone_number) {PhoneNumber.create(contact_id:person.id, contact_type:person.class, number:"111-222-3333")}

  before(:each) do
    assign(:phone_number, phone_number)
  end

  it 'renders the edit phone_number form' do
    render

    assert_select 'form[action=?][method=?]', phone_number_path(phone_number), 'post' do
      assert_select 'input[name=?]', 'phone_number[number]'

      assert_select 'input[name=?]', 'phone_number[contact_id]'
    end
  end

  it 'shows the contacts name in the header' do
    render

    assert_select("h1", text: "Editing phone number for #{phone_number.contact}")
  end
end

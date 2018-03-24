require 'rails_helper'

RSpec.describe 'phone_numbers/edit', type: :view do
  let(:person) { Person.create(first_name: 'Alice', last_name: 'Smith') }

  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
                                            number: 'MyString',
                                            contact_id: person.id,
                                            contact_type: person.class
    ))
  end

  it 'renders the edit phone_number form' do
    render

    assert_select 'form[action=?][method=?]', phone_number_path(@phone_number), 'post' do
      assert_select 'input[name=?]', 'phone_number[number]'

      assert_select 'input[name=?]', 'phone_number[contact_id]'
    end
  end
end

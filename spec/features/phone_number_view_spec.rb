require 'rails_helper'

describe 'the phone_number view' do
  let(:person) { Person.create!(first_name: 'John', last_name: 'Doe') }
  let(:phone_number) { PhoneNumber.create!(number:'1112223333', contact_id:person.id, contact_type: person.class)}

  before(:each) { visit phone_number_path(phone_number)}

  it "back button takes you to person page" do
    click_link 'Back'
    expect(current_path).to eq(person_path(person))
  end
end

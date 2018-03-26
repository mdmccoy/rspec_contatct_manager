require 'rails_helper'

describe 'email address views', type: :feature do
  let(:person) { Person.create(first_name:"Alice",last_name:"Smith")}
  let(:company) { Company.create(name: "Test Co")}


  describe 'new email' do

  it "back button goes to the person" do
    visit new_phone_number_path(contact_id: person.id, contact_type: person.class)
    click_link('Back')
    expect(current_path).to eq(person_path(person))
  end

  it "back button goes to company" do
    visit new_phone_number_path(contact_id: company.id, contact_type: company.class)
    click_link('Back')
    expect(current_path).to eq(company_path(company))
  end
end

describe 'edit phone number' do
  it "back button goes to a person" do
    phone_number = PhoneNumber.create(contact_id:person.id, contact_type:person.class, number: "111-222-3333")
    visit edit_phone_number_path(phone_number)
    click_link('Back')
    expect(current_path).to eq(person_path(person))
  end

  it "back button goes to a contact" do
    phone_number = PhoneNumber.create(contact_id:company.id, contact_type:company.class, number: "111-222-3333")
    visit edit_phone_number_path(phone_number)
    click_link('Back')
    expect(current_path).to eq(company_path(company))
  end
end
end

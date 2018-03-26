require 'rails_helper'

describe 'email address views', type: :feature do
  let(:person) { Person.create(first_name:"Alice",last_name:"Smith")}
  let(:company) { Company.create(name: "Test Co")}

  describe 'new email address' do
    it "back button goes to the person" do
      visit new_email_address_path(contact_id: person.id, contact_type: person.class)
      click_link('Back')
      expect(current_path).to eq(person_path(person))
    end

    it "back button goes to company" do
      visit new_email_address_path(contact_id: company.id, contact_type: company.class)
      click_link('Back')
      expect(current_path).to eq(company_path(company))
    end
  end

  describe 'edit email address' do
    it "back button goes to a person" do
      email_address = EmailAddress.create(contact_id:person.id, contact_type:person.class, address: "test@test.com")
      visit edit_email_address_path(email_address)
      click_link('Back')
      expect(current_path).to eq(person_path(person))
    end

    it "back button goes to a contact" do
      email_address = EmailAddress.create(contact_id:company.id, contact_type:company.class, address: "test@test.com")
      visit edit_email_address_path(email_address)
      click_link('Back')
      expect(current_path).to eq(company_path(company))
    end
  end
end

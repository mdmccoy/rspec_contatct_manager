require 'rails_helper'

describe 'new email address show page', type: :feature do
  let(:person) { Person.create(first_name:"Alice",last_name:"Smith")}
  let(:company) { Company.create(name: "Test Co")}

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

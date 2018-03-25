require 'rails_helper'

describe 'the company view', type: :feature do
  let(:company) { Company.create(name:"Test Company")}

  describe 'has phone numbers' do
    before(:each) do
      company.phone_numbers.create(number: '555-1234')
      company.phone_numbers.create(number: '555-5678')
      visit company_path(company)
    end

    it 'shows the phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type:company.class))
      click_link('Add phone number')
      # expect(current_path).to eq(new_phone_number_path(person_id: person.id))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-9012')
      page.click_button('Create Phone number')
      expect(current_path).to eq(company_path(company.id))
      expect(page).to have_content('555-9012')
    end

    it 'has link to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href:edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = company.phone_numbers.first
      old_number =  phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it "has a link to delete phone numbers" do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href:phone_number_path(phone))
      end
    end

    it "deletes a phone number" do
      phone = company.phone_numbers.first

      first(:link,'delete').click
      expect(current_path).to eq(company_path(company))
      expect(page).to_not have_link('delete', href:phone_number_path(phone))
    end
  end

  describe 'has email addresses' do
    before(:each) do
      company.email_addresses.create(address: 'alice@smith.com')
      company.email_addresses.create(address: 'alice2@smith2.com')
      visit company_path(company)
    end

    it "shows the email address in an li" do
      company.email_addresses.each do |email|
        expect(page).to have_selector('li', text: email.address)
      end
    end

    it 'has a create email link' do
      expect(page).to have_link('Add email address', id:'new_email_address', href:new_email_address_path(contact_id: company.id, contact_type: company.class))
    end

    it 'creates a new email address' do
      click_link('Add email address', id: 'new_email_address')
      page.fill_in('Address', with: 'john@doe.com')
      page.click_button('Create Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('john@doe.com')
    end

    it 'has a link to edit email addresses' do
      company.email_addresses.each do |email|
        expect(page).to have_link('edit',href: edit_email_address_path(email))
      end
    end

    it 'edits email addresses' do
      email_address = company.email_addresses.first
      click_link('edit',href:edit_email_address_path(email_address))
      page.fill_in('Address', with: "update@update.com")
      page.click_button('Update Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('update@update.com')
    end

    it 'has a link to delte email addresses' do
      company.email_addresses.each do |email|
        expect(page).to have_link('delete',href: email_address_path(email))
      end
    end

    it 'deletes email addresses' do
      email_address = company.email_addresses.first
      click_link('delete', href: email_address_path(email_address))
      expect(current_path).to eq(company_path(company))
      expect(page).to_not have_link('delete', href: email_address_path(email_address))
    end
  end
end

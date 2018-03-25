require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Person.new(first_name: 'Alice', last_name: 'Smith') }

  it 'person is valid' do
    expect(person).to be_valid
  end

  it 'is invalid without first_name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without last_name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it 'responds with its created phone numbers' do
    person.phone_numbers.build(number: '555-8888')
    expect(person.phone_numbers.map(&:number)).to eq(['555-8888'])
  end

  it 'responds with its created e-mail addresses' do
    person.email_addresses.build(address:'alice@smith.com')
    expect(person.email_addresses.map(&:address)).to eq(['alice@smith.com'])
  end
end

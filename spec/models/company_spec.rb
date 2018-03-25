require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) {Company.new(name:"Test Company")}

  it "is valid" do
    expect(company).to be_valid
  end

  it "is invalid w/o a name" do
    company.name = nil
    expect(company).to_not be_valid
  end

  it 'responds with its created phone numbers' do
    company.phone_numbers.build(number: '555-8888')
    expect(company.phone_numbers.map(&:number)).to eq(['555-8888'])
  end

  it 'responds with its created email addresses' do
    company.email_addresses.build(address: 'test@co.co')
    expect(company.email_addresses.map(&:address)).to eq(['test@co.co'])
  end
end

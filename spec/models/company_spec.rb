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

  it "has many phone numbers" do
    expect(company.phone_numbers).to eq([])
  end
end

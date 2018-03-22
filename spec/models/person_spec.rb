require 'rails_helper'

RSpec.describe Person, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is invalid without first_name" do
    person = Person.new(first_name: nil, last_name:"Doe")
    expect(person).not_to be_valid
  end

  it "is invalid without last_name" do
    person =  Person.new(last_name: nil, first_name: "Jane")
    expect(person).not_to be_valid
  end
end

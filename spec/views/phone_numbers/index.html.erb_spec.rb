require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  let(:person) do
    Person.create(first_name:"Alice", last_name:"Smith")
  end

  before(:each) do
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :number => "Number",
        :person => person
      ),
      PhoneNumber.create!(
        :number => "Number",
        :person => person
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => person.to_s, :count => 2
  end
end

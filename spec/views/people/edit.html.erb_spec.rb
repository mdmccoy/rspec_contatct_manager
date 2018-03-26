require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input[name=?]", "person[first_name]"

      assert_select "input[name=?]", "person[last_name]"
    end
  end

  it "displays the persons name in the header" do
    render

    assert_select("h1", "Editing #{@person.last_name}, #{@person.first_name}")
  end
end

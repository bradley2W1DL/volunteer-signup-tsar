require 'rails_helper'

RSpec.describe "signups/edit", type: :view do
  before(:each) do
    @signup = assign(:signup, Signup.create!(
      :name => "MyString",
      :email => "MyString",
      :phone_number => "MyString"
    ))
  end

  it "renders the edit signup form" do
    render

    assert_select "form[action=?][method=?]", signup_path(@signup), "post" do

      assert_select "input#signup_name[name=?]", "signup[name]"

      assert_select "input#signup_email[name=?]", "signup[email]"

      assert_select "input#signup_phone_number[name=?]", "signup[phone_number]"
    end
  end
end

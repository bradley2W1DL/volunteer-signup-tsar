require 'rails_helper'

RSpec.describe "signups/new", type: :view do
  before(:each) do
    assign(:signup, Signup.new(
      :name => "MyString",
      :email => "MyString",
      :phone_number => "MyString"
    ))
  end

  it "renders new signup form" do
    render

    assert_select "form[action=?][method=?]", signups_path, "post" do

      assert_select "input#signup_name[name=?]", "signup[name]"

      assert_select "input#signup_email[name=?]", "signup[email]"

      assert_select "input#signup_phone_number[name=?]", "signup[phone_number]"
    end
  end
end

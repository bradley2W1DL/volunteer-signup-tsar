require 'rails_helper'

RSpec.describe "signups/index", type: :view do
  before(:each) do
    assign(:signups, [
      Signup.create!(
        :name => "Name",
        :email => "Email",
        :phone_number => "Phone Number"
      ),
      Signup.create!(
        :name => "Name",
        :email => "Email",
        :phone_number => "Phone Number"
      )
    ])
  end

  it "renders a list of signups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
  end
end

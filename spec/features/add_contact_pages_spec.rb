require 'rails_helper'
describe "the creating contact process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "allows a user to create a contact", js: true do
    visit "/"
    click_on "Address Book"
    click_on "Add Contact"
    fill_in "Name", :with => "Bill"
    fill_in "User number", :with => "123456789"
    click_on "New Contact"
    expect(page).to have_content "123456789"
  end
end

require('spec_helper')

describe('path of showcase', {:type => :feature}) do
  it('allows a user to add a band') do
    visit('/')
    fill_in('name', :with => 'good band')
    click_button('add a band')
    expect(page).to have_content("Good band")
  end
end

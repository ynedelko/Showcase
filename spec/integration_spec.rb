require('spec_helper')

describe('path of showcase', {:type => :feature}) do
  # it('allows a user to add a band') do
  #   visit('/')
  #   fill_in('name', :with => 'good band')
  #   click_button('add a band')
  #   expect(page).to have_content("Good band")
  # end
  # it('allows a user to add a venue') do
  #   visit('/')
  #   fill_in('name', :with => 'good venue')
  #   click_button('add a venue')
  #   expect(page).to have_content("Good venue")
  # end
  #need to figure out how to test for "first" fill in and "second" fill in.
  it('lets you delete a venue') do
    test_venue = Venue.create({:name => "Cool venue"})
    visit("/venues/#{test_venue.id()}")
    click_button('Delete Cool venue')
    expect(page).to have_no_content("Cool venue")
  end
end

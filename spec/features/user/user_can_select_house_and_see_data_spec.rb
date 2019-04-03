require 'rails_helper'

describe 'House index' do
  describe 'As a user' do
    it 'I see a dropdown and can select a house and get its data' do
      # When I visit "/"
      visit '/'
      # And I select "Slytherin" from the dropdown
      expect(page).to have_select(:house)
      select "Slytherin", from: :house
      # And I click on "Get Students"
      expect(page).to have_button("Get Students")
      click_button "Get Students"
      # Then my path should be "/search" with "house=slytherin" in the parameters
      expect(current_path).to eq(search_path)
      # And I should see a message "22 Students"
      expect(page).to have_content("22 Students")
      # And I should see a list of the 22 members of Slytherin
      # And I should see a name and id for each student. -->
      within '.students' do
        expect(page).to have_css('.name', count: 22)
        expect(page).to have_css('.id', count: 22)
      end
    end
  end
end

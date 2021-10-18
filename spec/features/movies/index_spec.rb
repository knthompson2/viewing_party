require 'rails_helper'

RSpec.describe 'Movies index' do
  scenario 'user clicks on find top rated movies button', :vcr do
    visit discover_path

    click_on "Find Top Rated Movies"

    expect(current_path).to eq(movies_path)
    expect(page).to have_link("The Godfather")
    expect(page).to have_content("8.7")
  end

  scenario 'user searches by title for movies', :vcr do
    visit discover_path

    fill_in "search", with: "The Godfather"

    click_on "Find Movies"

    expect(current_path).to eq(movies_path)
    expect(page).to have_link("The Godfather")
    expect(page).to have_content("8.7")
  end

  it 'displays a link to find top rated movies', :vcr do
    visit movies_path

    expect(page).to have_button("Find Top Rated Movies")
  end

  it 'displays a form to find movies by title', :vcr do
    visit movies_path

    expect(page).to have_button("Find Movies")
  end
end

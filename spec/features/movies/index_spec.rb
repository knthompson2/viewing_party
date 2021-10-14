require 'rails_helper'

RSpec.describe 'Movies index' do
  it 'displays 40 top rated movies' do
    visit discover_path

    click_on "Find Top Rated Movies"
    save_and_open_page
    expect(current_path).to eq(movies_path)
    expect(page).to have_button("The Godfather")
    expect(page).to have_content("8.7")
  end

  it 'finds movies by title' do
    visit discover_path

    fill_in "search", with: "The Godfather"

    click_on "Find Movies"

    expect(current_path).to eq(movies_path)
    expect(page).to have_button("The Godfather")
    expect(page).to have_content("8.7")
  end
end

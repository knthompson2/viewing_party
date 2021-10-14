require 'rails_helper'

RSpec.describe 'Discover Page' do
  it 'displays a link to find top rated movies' do
    visit discover_path

    expect(page).to have_button("Find Top Rated Movies")
  end

  it 'displays a form to find movies by title' do
    visit discover_path

    expect(page).to have_button("Find Movies")
  end
end

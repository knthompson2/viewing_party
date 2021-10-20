require 'rails_helper'

RSpec.describe 'Discover Page' do
  before :each do
    visit discover_path
  end
  it 'displays a link to find top rated movies' do
    expect(page).to have_button("Find Top Rated Movies")
  end

  it 'displays a form to find movies by title' do
    expect(page).to have_button("Find Movies")
  end

  it 'displays a link to find upcoming movies' do
    expect(page).to have_button("Find Upcoming Movies")
  end
end

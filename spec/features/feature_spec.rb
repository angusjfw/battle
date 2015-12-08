require 'capybara'
require_relative '../../app.rb'

describe 'Features' do
  before do
    include Capybara::DSL
    Capybara.default_driver = :selenium
    visit 'http://localhost:4567/'
  end

  it 'can set name param with form' do
    fill_in('name', with: 'Angus')
    find_button('Fight!').click
    expect(page).to have_content('Angus')
  end
end

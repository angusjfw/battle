require 'capybara'
require_relative '../../app.rb'

describe 'Features' do
  before do
    include Capybara::DSL
    Capybara.default_driver = :selenium
    visit 'http://localhost:9393/'
  end

  it 'can set name param with form' do
    fill_in('name1', with: 'Angus')
    fill_in('name2', with: 'Computer')
    find_button('FIGHT!').click
    expect(page).to have_content('Angus VS Computer')
  end
end

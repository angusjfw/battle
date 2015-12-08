require 'capybara'
require_relative '../../app.rb'
include Capybara::DSL

describe 'Features' do
  Capybara.default_driver = :selenium

  feature 'Enter names' do
    scenario 'submitting names params with form' do
      sign_in_and_play
      expect(page).to have_content('Angus VS Computer')
    end
  end

  feature 'Hit points' do
    scenario 'shows other players HP' do
      sign_in_and_play
      expect{page.find('#player1-hp')}.to_not raise_error
    end

    scenario 'shows other players HP' do
      sign_in_and_play
      expect{page.find('#player2-hp')}.to_not raise_error
    end
  end
end

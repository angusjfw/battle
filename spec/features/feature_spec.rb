require 'capybara'
require_relative '../../app.rb'
include Capybara::DSL
Capybara.default_driver = :selenium
player1 = 'Pikachu'
player2 = 'Bulbasaur'

describe 'Features' do

  feature 'Enter names' do
    scenario 'submitting names params with form' do
      sign_in_and_play(player1, player2)
      expect(page).to have_content("#{player1} VS #{player2}")
    end
  end

  feature 'Hit points' do
    scenario 'shows other players HP' do
      sign_in_and_play(player1, player2)
      expect{page.find('#player1-hp')}.to_not raise_error
    end

    scenario 'shows other players HP' do
      sign_in_and_play(player1, player2)
      expect{page.find('#player2-hp')}.to_not raise_error
    end
  end

  feature 'Attack' do
    before do
      sign_in_and_play(player1, player2)
      click_button("ATTACK!")
    end

    scenario 'attack other player and get confirmation' do
      expect(page).to have_content "You attacked #{player2}!"
    end

    scenario 'attacking reduces enemy hp by 2' do
      click_button("OK")
      expect(page.find('#player2-hp')).to have_content('50/60 HP')
    end
  end
end

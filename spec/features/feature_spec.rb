require_relative '../../app.rb'

player1 = 'Pikachu'
player2 = 'Bulbasaur'

describe 'Features' do
  feature 'Enter names' do
    scenario 'submitting names params with form' do
      sign_in_and_play('Squirtle', player2)
      expect(page).to have_content('Squirtle')
    end
  end

  feature 'Hit points' do
    scenario 'shows player 1 HP' do
      sign_in_and_play(player1, player2)
      expect{page.find('#player1-hp')}.to_not raise_error
    end

    scenario 'shows other player 2 HP' do
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
      expect(page).to have_content "#{player1} attacked #{player2}!"
    end
  end

  feature 'process and switch turn' do
    before do
      sign_in_and_play(player1, player2)
      allow(Kernel).to receive(:rand).and_return 5
      click_button("ATTACK!")
    end

    scenario 'attacking reduces enemy hp' do
      expect(page.find('#player2-hp')).to have_content('50/60 HP')
    end

    scenario 'turn switches, player1 does not have buttons' do
      expect{page.find('#player1-controls')}.
        to raise_error(Capybara::ElementNotFound)   
    end
    
    scenario 'it is now player2s turn so he has the buttons' do
      expect{page.find('#player2-controls')}.to_not raise_error    
    end

    scenario 'player can now atttack' do
      click_button('ATTACK')
      expect(page).to have_content "#{player2} attacked #{player1}!"
    end

    scenario 'player2 attacking reduces player1 hp' do
      click_button('ATTACK')
      expect(page.find('#player1-hp')).to have_content('50/60 HP')
    end

    scenario 'switches back to player1s turn' do
      click_button('ATTACK')
      expect{page.find('#player1-controls')}.to_not raise_error    
      expect{page.find('#player2-controls')}.
        to raise_error(Capybara::ElementNotFound)   
    end
  end

  feature 'first player to reach 0hp loses' do
    scenario 'player 2 loses after being attacked 6 times' do
      sign_in_and_play(player1, player2)
      allow(Kernel).to receive(:rand).and_return 60
      click_button('ATTACK')
      expect(page).to have_content("#{player2} has fainted!")
    end
  end
end

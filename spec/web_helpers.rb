def sign_in_and_play(player1, player2) 
  allow(Kernel).to receive(:rand).and_return 0
  visit 'http://localhost:9292/'
  fill_in :name1, with: player1
  fill_in :name2, with: player2
  click_button 'FIGHT!'
end

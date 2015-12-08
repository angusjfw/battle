def sign_in_and_play 
  visit 'http://localhost:9292/'
  fill_in :name1, with: 'Angus'
  fill_in :name2, with: 'Computer'
  click_button 'FIGHT!'
end

describe 'Computer player' do

  # As a lonely Player,
  # So I can keep my Battle skills up to scratch
  # I want to play a Computerised opponent
  feature 'play a computerised opponent' do
    scenario 'select a computer' do
      sign_in_and_play_computer
    end

    context 'Player 1 standard attack' do
    scenario 'computer plays the game' do
      sign_in_and_play_computer
      attack_and_confirm
      expect(page).to have_content('Computerised Player has attacked Joe!')
    end
    end

  # As a Player,
  # So I can better enjoy a game of Battle,
  # I want some of my attacks to Paralyse an opponent (chance of losing their next attack)
    context 'Player 1 paralysis attack' do
      scenario 'computer plays the game' do
        sign_in_and_play_computer
        paralyse
        expect(page).to have_content('Computerised Player has attacked Joe!')
      end
    end


    scenario 'computer damages player 1' do
      allow(Kernel).to receive(:rand) { 5 }
      sign_in_and_play_computer
      attack_and_confirm
      click_button 'OK'
      expect(page).to have_content('Joe: 45 HP')
    end
  end

end

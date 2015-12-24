describe 'Poison attack' do
# As a Player,
# So I can better enjoy a game of Battle,
# I want one of my attacks to have a chance of Poisoning my Opponent (Opponent takes a small random amount of damage at the beginning of their turn)
  feature 'poisons a player' do
    context 'Player 1 poison attack' do
      scenario 'computer plays the game' do
        sign_in_and_play_computer
        click_button "Poison!"
        expect(page).to have_content('Computerised Player has been poisoned!')
      end
      scenario 'Player 2 receives poison damage on attack' do
        sign_in_and_play
        click_button "Poison!"
        srand(1)
        click_button "OK"
        click_button "Attack!"
        click_button "OK"
        expect(page).to have_content('Jane: 49 HP')
      end
      scenario 'Player 2 receives poison damage on poisoning' do
        sign_in_and_play
        click_button "Poison!"
        srand(1)
        click_button "OK"
        click_button "Poison!"
        click_button "OK"
        expect(page).to have_content('Jane: 49 HP')
      end
      scenario 'Player 2 receives poison damage on paralysis' do
        sign_in_and_play
        click_button "Poison!"
        srand(1)
        click_button "OK"
        click_button "Paralyse!"
        click_button "OK"
        expect(page).to have_content('Jane: 49 HP')
      end
    end
  end
end

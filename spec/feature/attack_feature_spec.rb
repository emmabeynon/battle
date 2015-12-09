describe 'User Stories' do

  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation
  feature 'Attack player' do
    scenario 'confirmation that Player 2 has been attacked' do
      sign_in_and_play
      click_button "Attack!"
      expect(page).to have_content 'Joe has attacked Jane!'
    end

    scenario "attack reduces Player 2's hit points" do
      sign_in_and_play
      click_button "Attack!"
      expect(page).not_to have_content 'Jane: 100 HP'
      expect(page).to have_content 'Jane: 90 HP'
    end
  end

    # As Player 1,
    # So I can see how close I am to winning
    # I want to see Player 2's Hit Points
    feature 'Player 2 hit points' do
      scenario 'see hit points' do
        sign_in_and_play
        expect(page).to have_content 'Jane: 100 HP'
      end
    end
end

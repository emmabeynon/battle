describe 'User Stories' do

  # As Player 1 (Joe),
  # So I can win a game of Battle,
  # I want to attack Player 2 (Jane), and I want to get a confirmation
  feature 'Attack' do
    before do
      allow(Kernel).to receive(:rand) { 10 }
    end

    scenario 'confirms that Player 1 has attacked Player 2' do
      sign_in_and_play
      click_button "Attack!"
      expect(page).to have_content 'Joe has attacked Jane!'
    end

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP
    scenario "reduces Player 2's hit points" do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content 'Jane: 50 HP'
      expect(page).to have_content 'Jane: 40 HP'
    end

  # As Player 1,
  # So I can lose a game of Battle,
  # I want Player 2 to attack me, and I want to get a confirmation
    scenario "confirms that Player 2 has attacked Player 1" do
      sign_in_and_play
      attack_and_confirm
      click_button "Attack!"
      expect(page).not_to have_content 'Joe has attacked Jane!'
      expect(page).to have_content 'Jane has attacked Joe!'
    end

  # As Player 1,
  # So I can start to lose a game of Battle,
  # I want Player 2's attack to reduce my HP
    scenario "reduces Player 1's hit points" do
      sign_in_and_play
      attack_and_confirm
      attack_and_confirm
      expect(page).not_to have_content 'Joe: 50 HP'
      expect(page).to have_content 'Joe: 40 HP'
    end

  # As a Player,
  # So I can play a suspenseful game of Battle,
  # I want all Attacks to deal a random amount of damage
    scenario "deals a random amount of damage" do
      sign_in_and_play
      click_button 'Attack!'
      expect(page).to have_content 'Joe has attacked Jane!'
    end
  end

  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  feature 'Hit points' do
    scenario "see Player 2's hit points" do
      sign_in_and_play
      expect(page).to have_content 'Jane: 50 HP'
    end

  # As Player 1,
  # So I can see how close I am to losing,
  # I want to see my own hit points
    scenario "see Player 1's hit points" do
      sign_in_and_play
      expect(page).to have_content 'Joe: 50 HP'
    end
  end
end

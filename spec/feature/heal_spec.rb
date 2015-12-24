# As a Player,
# So I can extend my joyous experience of Battle,
# I want to have an attack that heals some of my Hit Points
describe 'Heal attack' do
  feature 'heals player' do
    scenario 'confirms that the player has chosen heal' do
        sign_in_and_play
        attack_and_confirm
        attack_and_confirm
        click_button 'Heal'
        expect(page).to have_content 'Joe has chosen to heal.'
    end
    
    scenario 'increases player 1\'s hit points' do
      sign_in_and_play
      attack_and_confirm
      allow(Kernel).to receive(:rand) { 10 }
      attack_and_confirm
      allow(Kernel).to receive(:rand) { 5 }
      click_button 'Heal'
      expect(page).to have_content 'Joe: 45 HP'
    end

    xscenario 'cannot be used if player\'s hit points are at default level' do
      sign_in_and_play
    end

    xscenario 'cannot increase player\'s hit points above default HP' do
      sign_in_and_play
    end
  end
end

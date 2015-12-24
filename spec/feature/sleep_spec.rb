# As a Player,
# So I can better enjoy a game of Battle,
# I want to make an attack that has a chance of sending my Opponent to Sleep (Opponent definitely misses next turn)

describe 'Sleep attack' do
  feature 'send opponent to sleep' do
    scenario 'can be done' do
      sign_in_and_play
      click_button 'Send opponent to sleep!'
      expect(page).to have_content 'Joe has tried to send Jane to sleep!'
    end

    xscenario 'successfully and views confirmation message' do
      sign_in_and_play
      send_to_sleep
      expect(page).to have_content 'Jane is asleep and misses their turn.'
    end

    xscenario 'successfully and opponent misses turn' do
      sign_in_and_play
      send_to_sleep
      click_button 'OK'
      expect(page).to have_content "It's Joe's turn."
    end

    xscenario 'unsuccessfully and views confirmation message' do
      sign_in_and_play
      send_to_sleep
      expect(page).to have_content 'Jane is still awake.'
    end

    xscenario 'unsuccessfully and opponent takes their turn' do
      sign_in_and_play
      send_to_sleep
      click_button 'OK'
      expect(page).to have_content "It's Jane's turn."
    end
  end
end

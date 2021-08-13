require 'models/game'
require 'models/player'

describe Game do
  it "attacks other player" do
    player_2 = Player.new("Tom")
    expect { subject.attack(player_2) }.to change { player_2.hp }.by(-10)
  end
end
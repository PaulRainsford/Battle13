require 'models/player'


describe Player do
  subject(:paul) { Player.new("Paul") }
  it  "returns it's name" do
    expect(paul.name).to eq("Paul")
  end

  it "has default hitpoints" do 
    expect(paul.hp).to eq Player::INITIAL_HP
  end

  it "can take damage to hp" do
    expect { paul.receive_dmg }.to change { paul.hp }.by(-10)
  end
end
require "../lib/board.rb"
require "../lib/player.rb"
require "../lib/game.rb"

describe Board do
  
end

describe Player do
  let(:player1) { Player.new('Karthick','X') }
  it 'GOOD CHECK - Checks the name can be read' do
    expect(player1.name).to eql('Karthick')
  end

  it 'GOOD CHECK - Checks the token can be read' do
    expect(player1.token).to eql('X')
  end

  it 'BAD CHECK - Checks if the name can be changed' do
    expect {player1.name = 'Mateo'}.to raise_error(NoMethodError)
  end

  it 'BAD CHECK - Checks if the token can be changed' do
    expect {player1.token = 'Mateo'}.to raise_error(NoMethodError)
  end
end

describe Game do
  
end
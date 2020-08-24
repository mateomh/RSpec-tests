require "./lib/board.rb"
require "./lib/player.rb"
require "./lib/game.rb"

describe Board do
  let (:case1) {Board.new}
  let (:empty_board) {Board.new}
  let (:move) {Board.new}
  it 'checks board' do
    expect(case1.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
  
  it 'checks board' do
    case1.take_position(1,'X')
    expect(case1.board).to eql(['X', 2, 3, 4, 5, 6, 7, 8, 9])
  end
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
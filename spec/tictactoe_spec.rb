require './lib/board.rb'
require './lib/player.rb'
require './lib/game.rb'

describe Board do
  let(:case1) { Board.new }
  let(:empty_board) { Board.new }
  let(:move) { Board.new }
  it 'checks board' do
    expect(case1.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'checks board' do
    case1.take_position(1, 'X')
    expect(case1.board).to eql(['X', 2, 3, 4, 5, 6, 7, 8, 9])
  end
end

describe Player do
  let(:player1) { Player.new('Karthick', 'X') }
  it 'GOOD CHECK - Checks the name can be read' do
    expect(player1.name).to eql('Karthick')
  end

  it 'GOOD CHECK - Checks the token can be read' do
    expect(player1.token).to eql('X')
  end

  it 'BAD CHECK - Checks if the name can be changed' do
    expect { player1.name = 'Mateo' }.to raise_error(NoMethodError)
  end

  it 'BAD CHECK - Checks if the token can be changed' do
    expect { player1.token = 'Mateo' }.to raise_error(NoMethodError)
  end
end

describe Game do
  let(:game) { Game.new('Karthick', 'Mateo', [1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:winning_row1) { ['X', 'X', 'X', 4, 5, 6, 7, 8, 9] }
  let(:winning_row2) { [1, 2, 3, 'X', 'X', 'X', 7, 8, 9] }
  let(:winning_row3) { [1, 2, 3, 4, 5, 6, 'X', 'X', 'X'] }
  let(:winning_col1) { ['X', 2, 3, 'X', 5, 6, 'X', 8, 9] }
  let(:winning_col2) { [1, 'X', 3, 4, 'X', 6, 7, 'X', 9] }
  let(:winning_col3) { [1, 2, 'X', 4, 5, 'X', 7, 8, 'X'] }
  let(:winning_diag1) { ['X', 2, 3, 4, 'X', 6, 7, 8, 'X'] }
  let(:winning_diag2) { [1, 2, 'X', 4, 'X', 6, 'X', 8, 9] }
  let(:winmove_row) { [1, 2, 3, 'X', 'X', 6, 7, 8, 9] }
  let(:nowinmove_row) { [1, 2, 3, 'X', 'X', 'O', 7, 8, 9] }
  let(:winmove_col) { [1, 2, 'X', 4, 5, 'X', 7, 8, 9] }
  let(:nowinmove_col) { [1, 2, 'X', 4, 5, 'X', 7, 8, 'O'] }
  let(:winmove_diag) { ['X', 2, 3, 4, 'X', 6, 7, 8, 9] }
  let(:nowinmove_diag) { ['X', 2, 3, 4, 'X', 6, 7, 8, 'O'] }
  let(:nowinmove_special) { [1, 2, 'X', 4, 'X', 6, 7, 8, 'X'] }
  
  it 'Checks for no winning' do
    expect(game.check_victory('X', [1, 2, 3, 4, 5, 6, 7, 8, 9])).to eql(false)
  end

  it 'Checks winning with row one' do
    expect(game.check_victory('X', winning_row1)).to eql(true)
  end

  it 'Checks winning with row two' do
    expect(game.check_victory('X', winning_row2)).to eql(true)
  end

  it 'Checks winning with row three' do
    expect(game.check_victory('X', winning_row3)).to eql(true)
  end

  it 'Checks winning with column one' do
    expect(game.check_victory('X', winning_col1)).to eql(true)
  end

  it 'Checks winning with column two' do
    expect(game.check_victory('X', winning_col2)).to eql(true)
  end

  it 'Checks winning with column three' do
    expect(game.check_victory('X', winning_col3)).to eql(true)
  end

  it 'Checks winning with main diagonal' do
    expect(game.check_victory('X', winning_diag1)).to eql(true)
  end

  it 'Checks winning with inverted diagonal' do
    expect(game.check_victory('X', winning_diag2)).to eql(true)
  end

  it 'Checks for winning move row' do
    expect(game.check_win_move('X',winmove_row)).to eql(true)
  end

  it 'Checks for not a winning move row' do
    expect(game.check_win_move('X',nowinmove_row)).to eql(false)
  end

  it 'Checks for winning move column' do
    expect(game.check_win_move('X',winmove_col)).to eql(true)
  end

  it 'Checks for not a winning move column' do
    expect(game.check_win_move('X',nowinmove_col)).to eql(false)
  end

  it 'Checks for winning move diagonal' do
    expect(game.check_win_move('X',winmove_diag)).to eql(true)
  end

  it 'Checks for not a winning move diagonal' do
    expect(game.check_win_move('X',nowinmove_diag)).to eql(false)
  end

  it 'Checks for a special board layout for the diagonal' do
    expect(game.check_victory('X',nowinmove_special)).to eql(false)
  end

  it 'Checks for a valid position' do
    expect(game.check_position(1,[1, 2, 3, 'X', 'X', 'X', 7, 8, 9])).to eql(true)
  end

  it 'Checks for a not valid position' do
    expect(game.check_position(0,[1, 2, 3, 'X', 'X', 'X', 7, 8, 9])).to eql(false)
  end

  it 'Checks for an occupied position' do
    expect(game.check_position(5,[1, 2, 3, 'X', 'X', 'X', 7, 8, 9])).to eql(false)
  end
end

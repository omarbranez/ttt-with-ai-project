class Game
    WIN_COMBINATIONS = [
        [0,1,2], #top row
        [3,4,5], #middle row
        [6,7,8], #bottom row
        [0,3,6], #left column
        [1,4,7], #middle column
        [2,5,8], #right column
        [0,4,8], #forward slash
        [2,4,6] #back slash
    ]
    attr_accessor :board, :player_1, :player_2
    
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        @board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |combos| @board.cells[combos[0]] == @board.cells[combos[1]] && @board.cells[combos[1]] == @board.cells[combos[2]] && @board.taken?(combos[0]+1)
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        @board.cells[won?.first] if won?   
    end

    def turn
        current_move = current_player.move(@board) # new local variable since apparently we can't use a nested argument? thanks for nothing, ruby.
        @board.valid_move?(current_move) ? @board.update(current_move, current_player) : turn
        @board.display
        #binding.pry
    end

    def play
        turn until over?
        puts won? ? "Congratulations #{winner}!" : "Cat's Game!" #in order to use puts in a ternary, you need to place puts outside the method. who knew?
        #binding.pry
    end
end

class Board
        
    attr_accessor :cells

    def initialize()
        reset!
        #@cells = Array.new(9, " ")
    end

    def reset!
        @cells = Array.new(9, " ")
    end
        

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} " 
    end

    def position(input)
        cells[input.to_i - 1]
    end

    def full?
        cells.none? {|board_spaces| board_spaces == " "} #check @board to make sure NONE of the spaces have " " strings
    end

    def turn_count
        cells.count {|tokens| ["X","O"].include? tokens}
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        !taken?(input) && input.to_i.between?(1,9) 
        #it is a valid move if the position is NOT occupied and the input is between 1 and 9         
    end
    
    def update(position, current_player)
        cells[position.to_i - 1] = current_player.token
    end
 
end

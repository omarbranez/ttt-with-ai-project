module Players
    class Computer < Player        

        def move(board)
            if board.turn_count == 0
                move = "5"
                elsif board.turn_count == 1 
                    @first_comp_turn
                elsif board.turn_count == 2
                    ideal_valid_move.to_s
                else
                    Game::WIN_COMBINATIONS.detect do |combos|
                        comp_player_danger? ? comp_win.to_s : hmn_player_danger?
                        hmn_player_danger? ? combo_breaker.to_s : ideal_valid_move.to_s
                    end
                end
            end 
        end
    end                              
                    
                            # def break_combo
                            #     if WIN_COMBINATIONS 2 of 3 contain human token && computer is not one move from winning
                            #         move[3rd unused spot] # make this the move case
                            # def complete_combo
                            #     if WIN_COMBINATIONS 2 of 3 contain computer token 
                            #         move[3rd unused spot]
                            # def edge
                            #     board spots 1,3,5,7
                            # def corner
                            #     board spots 0,2,6,8
                            # if first move is corner or edge
                            #     do center 
                            # if first move is middle
                            #     do corner 
                            # if neither break_combo or complete_combo condition are true
                            #     do edge random
                            # if player picked an edge first AND looks like XOX 
                            #     do corner random
    
    
    def hmn_player_danger?
        Game::WIN_COMBINATIONS.detect do |combos| combos.select{|idx| board.position(idx+1) != token}.length == 2 && combos.any?{|idx| board.position(idx+1) == " "}
    end
    
    def combo_breaker
        combos.select{|idx| !board.taken?(idx+1)}.first.to_i
    end 

    def comp_player_danger?
        Game::WIN_COMBINATIONS.detect do |combos| combos.select{|idx| board.position(idx+1) == token}.length == 2 && combos.any?{|idx| board.position(idx+1) == " "}
        #@board.cells[Game::WIN_COMBINATIONS.map do |combos| @board.cells[combos[0]] == @board.cells[combos[1]] || @board.cells[combos[1]] == @board.cells[combos[2]] || @board.cells[combos[1]] == @board.cells[combos[2]].include? "O"]
    end 

    def comp_win
        combos.select{|idx| !board.taken?(idx+1)}.first.to_i
    end


    def first_comp_turn
        if board.taken?(5) #if X takes center first, take a corner (top left for simplicity)
            move = "1"
        elsif board.taken?.include?(1,3,7,9) # if X takes a corner first, take the center
            move = "5"
        else  board.taken?.include?(2,4,6,8) # if X takes an edge first, take the center
            move = "5"
        end
    end

    def ideal_valid_move
        [1,3,7,9].detect {|idx| !board.taken?(idx)} #ideally corner
        if nil
            [2,4,6,8].detect {|idx| !board.taken?(idx)} #otherwise edge
        end
    end

end
end
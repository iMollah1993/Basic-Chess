module stepable
    def moves
        possible_moves = []

        # iterate through each of the piece's possible move_diffs
        self.move_diffs.each do |move|
            
            
            # add new position to the moves array if it is 1) on the board and empty or 2) on the board and contains enemy piece
            possible_moves << move if board_valid_pos?(pos) && board_empty?(pos) || board_empty?(pos) && board_contains_enemy?(pos)     # self.board.valid_pos?(move)
        end

        possible_moves
    end

    def board_valid_pos?(pos)
        row, col = pos
        row 
    end

    def board_empty?(pos)

    end

    def board_contains_enemy?(pos)

    end

    private
    def move_diffs
        raise NotImplementedError
    end
end
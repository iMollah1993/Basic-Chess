module Slideable
    HORIZONTAL_DIRS = [
        [-1,0],         # up
        [1,0],          # down
        [0,1],          # right
        [0,-1]          # left
    ].freeze

    DIAGONAL_DIRS = [
        [-1, -1],       # up + left
        [-1, 1],        # up + right
        [1, -1],        # down + left
        [1, 1]          # down + right
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end
 
    def moves           # return all possible moves
        moves = []

        self.move_dirs.each do |move|
            moves += grow_unblocked_moves_in_dir(move[0], move[1])
        end
        
        moves
    end

    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []

        row, col = self.pos
        avail_pos = [row + dy, col + dx]

        # check each position until we are out of bounds
        while self.board.valid_pos?(avail_pos)          
            if self.board[pos] == self.board.null_piece                 # add position if board position == empty?
                moves << avail_pos 
            elsif self.board.rows[row][col].color != self.color         # add position & break if board position == enemy colored piece
                moves << avail_pos
                break
            elsif self.board.rows[row][col].color == self.color         # dont add position & break if board position == ally colored piece
                moves << avail_pos
                break
            end

            avail_pos = [avail_pos[0] + dy, avail_pos[1] + dx]
        end

        moves
    end
end
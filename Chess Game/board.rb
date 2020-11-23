require_relative "piece"
require_relative "null_piece"

class Board
    attr_reader :rows, :null_piece

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @null_piece = NullPiece.instance

        fill_initial_board
    end

    def [](pos)             # [0, 0]
        row, col = pos
        rows[row][col]
    end

    def []=(pos,val)
        row, col = pos
        rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        # assign end_pos on the board to value of start_pos
        raise 'not a valid position on the board' if !valid_pos?(start_pos) || !valid_pos?(end_pos)

        if self[start_pos] == null_piece
            raise 'there is no piece at start_pos'
        elsif self[end_pos] != null_piece
            raise 'the piece cannot move to end_pos'
        else
            # assign end position with start_pos piece
            self[end_pos] = self[start_pos]
            # reassign null_piece to start_pos
            self[start_pos] = null_piece
        end
    end

    def valid_pos?(pos)
        row, col = pos
        !(row < 0 || row > 7 || col < 0 || col > 7)
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end

    private

    def fill_initial_board
        (0...8).each do |row|
            (0...8).each do |col|
                if row <= 1
                    rows[row][col] = Piece.new(:black, self, [row, col])
                elsif row >= 6
                    rows[row][col] = Piece.new(:white, self, [row, col])
                else
                    rows[row][col] = @null_piece
                end
            end
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    b = Board.new
    p b
end
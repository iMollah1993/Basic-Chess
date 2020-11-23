class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    #temporary #moves method that's not in the UML
    def moves
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol
    end

    private
    attr_reader :board, :pos

    def move_into_check?(end_pos)
    end
end
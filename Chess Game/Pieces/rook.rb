require_relative "piece"
require "../Modules/slideable"

class Rook < Piece
    include Slideable
    
    def symbol
        “♖”
    end

    private
    def move_dirs
        horizontal_dirs
    end
end
require_relative "piece"
require "../Modules/stepable.rb"

class Knight < Piece
    include Stepable
    
    def symbol
        “♖”
    end

    private
    def move_dirs
        
    end
end
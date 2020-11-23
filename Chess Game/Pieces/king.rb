require_relative "piece"
require "../Modules/stepable.rb"

class King < Piece
    include Stepable
    
    def symbol
        “♔”
    end

    private
    def move_dirs
        
    end
end
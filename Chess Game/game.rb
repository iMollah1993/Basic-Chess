require_relative "player.rb"
require_relative "display.rb"
require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @display = Display.new
        @players = [Player.new(:white, @display), Player.new(:black, @display)]
        @current_player = @players[0]
    end

    def play
    end

    private
    def notify_players
    end

    def swap_turn!
        @current_player = @current_player == @players[0] ? @players[1] : @players[0]
    end
end
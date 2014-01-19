#!/usr/bin/env ruby

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	moves = ["R", "P", "S"]
	game.each do |g|
		raise NoSuchStrategyError unless moves.include? g[1].upcase
	end

	player1 = game[0]
	player2 = game[1]
	
	case game[0][1].upcase
	when "R"
		game[1][1].upcase.eql?("P") ? (return player2) : (return player1)
	when "P"
		game[1][1].upcase.eql?("S") ? (return player2) : (return player1)
	when "S"
		game[1][1].upcase.eql?("R") ? (return player2) : (return player1)
	end
end

def rps_tournament_winner(games)
	if games[0][1].is_a?(String)
		return rps_game_winner(games)
	else
		winner1 = rps_tournament_winner(games[0])
		winner2 = rps_tournament_winner(games[1])
		return rps_tournament_winner([winner1, winner2])
	end
end

if __FILE__ == $0
	game = [ [ "Armando", "P" ], [ "Dave", "S" ] ] 
	puts rps_game_winner(game)

	game = [ [ "Armando", "P" ], [ "Dave", "r" ] ] 
	puts rps_game_winner(game)

	game = [ [ "Armando", "s" ], [ "Dave", "R" ] ] 
	puts rps_game_winner(game)

	tournament = [ [ [ ["Armando", "P"], ["Dave", "S"] ], [ ["Richard", "R"],  ["Michael", "S"] ], ], [ [ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ] ] ]
	puts rps_tournament_winner(tournament)
end

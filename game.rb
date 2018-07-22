require_relative 'tile'

class Game
	def initialize(window)
		@window = window
		@tiles = []

		#Builds empty unopened board
		(0..7).each do |row|
			(0..7).each do |column|
				@tiles.push Tile.new(@window, row, column, 0)
			end
		end

		10.times do
			randRow = rand(0...8)
			randColumn = rand(0...8)
			@tiles[randRow * 8 + randColumn].setNumber(9) if @tiles[randRow * 8 + randColumn].number != 9
		end
	end

	def handle_left_mouse_up(x,y)
		row = (y.to_i - 82) / 30
		column = (x.to_i - 82) / 30
		@selected_tile = get_tile(column, row)
		return if @selected_tile.status == 1
		@selected_tile.setStatus(2)
	end

	def handle_right_mouse_up(x,y)
		row = (y.to_i - 82) / 30
		column = (x.to_i - 82) / 30
		@selected_tile = get_tile(column, row)
		if @selected_tile.status == 0
			@selected_tile.setStatus(1)
		else 
			@selected_tile.setStatus(0)
		end
	end

	def get_tile(column, row)
		if column < 0 or column > 7 or row < 0 or row > 7
			return nil
		else
			return @tiles[row * 8 + column]
		end
	end

	def draw
		@tiles.each do |tile|
			tile.draw
		end
	end

	def update

	end
end
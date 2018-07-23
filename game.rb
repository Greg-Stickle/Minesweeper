require_relative 'tile'

class Game
	def initialize(window)
		@window = window
		@tiles = []

		#Builds empty unopened board
		(0..9).each do |row|
			(0..9).each do |column|
				@tiles.push Tile.new(@window, row, column, 0)
			end
		end

		10.times do
			randRow = rand(1...8)
			randColumn = rand(1...8)
			@tiles[randRow * 10 + randColumn].setNumber(9) if @tiles[randRow * 10 + randColumn].number != 9
		end

		(1..8).each do |row|
			(1..8).each do |column|
				'giveNumber(row,column)'
			end
		end
	end

	def giveNumber(row,column)
		newNumber = 0
		puts "#{@tiles[row * 8 + column].number}"
		#Searches Up 
		newNumber += 1 if @tiles[row - 1 * 8 + column].number == 9
		#Searches Up and Left
		newNumber += 1 if @tiles[row - 1 * 8 + column - 1].number == 9
		#Searches Up and Right
		newNumber += 1 if @tiles[row - 1 * 8 + column + 1].number == 9
		#Searches Down 
		newNumber += 1 if @tiles[row + 1 * 8 + column].number == 9
		#Searches Down and Left
		newNumber += 1 if @tiles[row + 1 * 8 + column - 1].number == 9
		#Searches Down and Right
		newNumber += 1 if @tiles[row + 1 * 8 + column + 1].number == 9 
		#Searches Left
		newNumber += 1 if @tiles[row * 8 + column - 1].number == 9
		#Searches Right
		newNumber += 1 if @tiles[row * 8 + column + 1].number == 9
		@tiles[row * 8 + column].setNumber(newNumber)	
	end

	def handle_left_mouse_up(x,y)
		row = (y.to_i - 82) / 30
		column = (x.to_i - 82) / 30
		@selected_tile = get_tile(column, row)
		return if @selected_tile == nil
		return if @selected_tile.status == 1
		@selected_tile.setStatus(2)
	end

	def handle_right_mouse_up(x,y)
		row = (y.to_i - 82) / 30
		column = (x.to_i - 82) / 30
		@selected_tile = get_tile(column, row)
		return if @selected_tile == nil
		return if @selected_tile.status == 2
		if @selected_tile.status == 0
			@selected_tile.setStatus(1)
		else 
			@selected_tile.setStatus(0)
		end
	end

	def get_tile(column, row)
		if column < 0 or column > 9 or row < 0 or row > 9
			return nil
		else
			return @tiles[row * 10 + column]
		end
	end

	def draw
		(1...8).each do |row|
			(1...8).each do |column|
				@tiles[row * 10 + column].draw
			end
		end
	end

	def update

	end
end
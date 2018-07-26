require_relative 'tile'

class Game
	def initialize(window)
		@window = window
		@tiles = []
		@over = false

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
				giveNumber(row,column)
			end
		end
	end

	def openMines
		(1..8).each do |row|
			(1..8).each do |column|
				@tiles[row * 10 + column].setStatus(2) if @tiles[row * 10 + column].number == 9
			end
		end
	end

	def openTile(column, row)
		return if row == 0 or row == 9 or column == 0 or column == 9
		if @tiles[row * 10 + column].number == 0 
			(-1..1).each do |rowManip|
				(-1..1).each do |columnManip|
					testRow = row + rowManip
					testColumn = column + columnManip
					@tiles[(testRow) * 10 + (testColumn)].setStatus(2)
					openTile(testColumn, testRow) if @tiles[(testRow) * 10 + (testColumn)].number == 0
				end
			end
		else
			return
		end
	end

	def giveNumber(row,column)
		newNumber = 0
		return if @tiles[row * 10 + column].number == 9
		(-1..1).each do |rowManip|
			(-1..1).each do |columnManip|
				newNumber += 1 if @tiles[(row + rowManip) * 10 + (column + columnManip)].number == 9
			end
		end
		@tiles[row * 10 + column].setNumber(newNumber)
	end

	def handle_left_mouse_up(x,y)
		if @over == false
			row = (y.to_i - 82) / 30
			column = (x.to_i - 82) / 30
			@selected_tile = get_tile(column, row)
			openTile(column,row) if @selected_tile.number == 0 and @selected_tile.status == 0
			return if @selected_tile.status == 1
			@selected_tile.setStatus(2)
			if @selected_tile.number == 9
				openMines
				@over = true
			end
		end
	end

	def handle_right_mouse_up(x,y)
		row = (y.to_i - 82) / 30
		column = (x.to_i - 82) / 30
		@selected_tile = get_tile(column, row)
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
end

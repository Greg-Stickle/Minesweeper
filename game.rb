require_relative 'tile'

class Game

	attr_reader :over, :won, :first_move, :flags
	def initialize(window)
		@window = window
		@buffer = (@window.width - 255) / 2
		@image_buffer = 30
		@first_move = true
		@tiles = []
		@over = false
		@won = false
		@stack = []
		@flags = 10
		#Builds empty unopened board
		(0..9).each do |row|
			(0..9).each do |column|
				@tiles.push Tile.new(@window, row, column, 0, true)
			end
		end

		10.times do
			randRow = rand(1...8)
			randColumn = rand(1...8)
			@tiles[randRow * 10 + randColumn].setNumber(9) if @tiles[randRow * 10 + randColumn].number != 9
		end

		numberBoard
	end

	def numberBoard()
		(1..8).each do |row|
			(1..8).each do |column|
				giveNumber(row,column)
				@tiles[row * 10 + column].setChecked(false)
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

	def checkWin()
		count = 0
		(1..8).each do |row|
			(1..8).each do |column|
				index = row * 10 + column
				count += 1 if @tiles[index].status == 1 and @tiles[index].number == 9
			end
		end
		@won = true if count == 10
	end

	def openTile(column, row)
		tile = @tiles[row * 10 + column]
		return nil if column < 0 or column > 9 or row < 0 or row > 9
		return if tile.status == 1

		if tile.number == 9 && @first_move == false
			openMines
			@over = true
		elsif tile.number == 9 && @first_move == true
			set = false
			index = 11
			until set
				if @tiles[index].number != 9
					@tiles[index].setNumber(9)
					tile.setNumber(0)
					numberBoard
					tile.setStatus(2) 
					set = true
					@first_move = false
				end
				index += 1
			end
		elsif tile.number != 0
			tile.setStatus(2)
			@first_move = false
		else
			tile.setStatus(2) if tile.checked == false
			tile.setChecked(true)
			(-1..1).each do |rowManip|
				(-1..1).each do |columnManip|
					testRow = row + rowManip
					testColumn = column + columnManip
					newTile = @tiles[testRow * 10 + testColumn] 
					newTile.setStatus(2) if newTile.status == 0
					openTile(newTile.column, newTile.row) if newTile.number == 0 and newTile.checked == false and newTile.status == 2
				end
			end
			@first_move = false
		end
		checkWin
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
		if @over == false #Gameover clause
			row = (y.to_i - @buffer - @image_buffer) / 30 
			column = (x.to_i - @buffer) / 30
			openTile(column,row)
		end
	end

	def handle_right_mouse_up(x,y)
		row = (y.to_i - @buffer - @image_buffer) / 30
		column = (x.to_i - @buffer) / 30
		@selected_tile = get_tile(column, row)
		return if @selected_tile.status == 2
		if @selected_tile.status == 0
			@selected_tile.setStatus(1)
			@flags -= 1
		else 
			@selected_tile.setStatus(0)
			@flags += 1
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

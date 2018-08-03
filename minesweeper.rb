require 'gosu'
require_relative 'game'

class Minesweeper < Gosu::Window

	def initialize
		@winSize = 400
		super(@winSize,@winSize)
		@buffer = (@winSize - 255) / 2
		@image_buffer = 30
		self.caption = "Minesweeper"
		@game = Game.new(self)
		@time = 0
		@timer_font = Gosu::Font.new(30)
		@win_font = Gosu::Font.new(45)
		@smile_image = Gosu::Image.new("Smile.png")
		@smile_dead_image = Gosu::Image.new("SmileDead.png")
		@smile_won_image = Gosu::Image.new("SmileWon.png")
		@first = true
	end

	def needs_cursor?
		true
	end

	def button_up(id)
		if id == Gosu::MsLeft
			if(mouse_x > @buffer and mouse_x < @winSize - @buffer and mouse_y > @buffer and mouse_y < @winSize - @buffer)
				if @game.first_move == true
					@start_time = Gosu::milliseconds
					@game.handle_left_mouse_up(mouse_x, mouse_y)
					@clicked = true
				else
					@game.handle_left_mouse_up(mouse_x, mouse_y) 
				end
			elsif (mouse_x > @winSize / 2 - 30 and mouse_x < @winSize / 2 + 30 and mouse_y > @buffer - @image_buffer and mouse_y < @buffer + @image_buffer)
				@game = Game.new(self)
				@clicked = false
				@start_time = Gosu::milliseconds
				@time = 0
			end
		elsif id == Gosu::MsRight
			@game.handle_right_mouse_up(mouse_x, mouse_y)
		end
	end

	def draw
		@game.draw
		@timer_font.draw("#{@time.to_s}", @winSize - @buffer - 30, @buffer + @image_buffer, 2, 1, 1, 0xff_FF0000)
		@win_font.draw("You won!", @winSize / 2 - 15, @winSize - @buffer + @image_buffer, 2) if @game.won == true
		if @game.over
			@smile_dead_image.draw(@winSize / 2 - 30, @buffer / 2,2)
		elsif 
			@smile_won_image.draw(@winSize / 2 - 30, @buffer / 2,2)
		else
			@smile_image.draw(@winSize / 2 - 30, @buffer / 2,2)	
		end
		@timer_font.draw("#{@game.flags.to_s}", @buffer + 30, @buffer + @image_buffer, 2, 1, 1, 0xff_FF0000)
	end

	def update
		@time = (Gosu::milliseconds - @start_time) / 1000 if @clicked == true && @game.over == false && @game.won == false
	end
end

window = Minesweeper.new
window.show
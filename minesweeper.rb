require 'gosu'
require_relative 'game'

class Minesweeper < Gosu::Window

	def initialize
		super(460,460)
		self.caption = "Minesweeper"
		@game = Game.new(self)
		@timer_font = Gosu::Font.new(30)
		@win_font = Gosu::Font.new(45)
		@start_time = 0
	end

	def needs_cursor?
		true
	end

	def button_down(id)
		if id == Gosu::MsLeft
			@game.handle_left_mouse_down(mouse_x,mouse_y)
		end
	end

	def button_up(id)
		if id == Gosu::MsLeft 
			@game.handle_left_mouse_up(mouse_x, mouse_y)
			@clicked = true
		elsif id == Gosu::MsRight
			@game.handle_right_mouse_up(mouse_x, mouse_y)
		end
	end

	def draw
		@game.draw
		@timer_font.draw("#{@time.to_s}", 296, 80, 2)
		@win_font.draw("You won!", 130, 330, 2) if @game.won == true
	end

	def update
		@time = (Gosu::milliseconds - @start_time) / 1000 if @clicked == true && @game.over == false && @game.won == false
	end
end

window = Minesweeper.new
window.show
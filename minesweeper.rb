require 'gosu'
require_relative 'game'

class Minesweeper < Gosu::Window

	def initialize
		super(460,460)
		self.caption = "Minesweeper"
		@game = Game.new(self)
	end

	def needs_cursor?
		true
	end

	def button_up(id)
		if id == Gosu::MsLeft
			@game.handle_left_mouse_up(mouse_x, mouse_y)
		elsif id == Gosu::MsRight
			@game.handle_right_mouse_up(mouse_x, mouse_y)
		end
	end

	def draw
		@game.draw
	end
end

window = Minesweeper.new
window.show
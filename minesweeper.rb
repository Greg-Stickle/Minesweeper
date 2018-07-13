require 'gosu'

class Minesweeper < Gosu::Window
	def initialize
		super (400,400)
		self.caption("Minesweeper")

		
	end
end

window = Minesweeper.new
window.show
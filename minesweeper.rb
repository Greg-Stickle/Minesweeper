require 'gosu'

class Minesweeper < Gosu::Window
	def initialize
		super(400,400)
		self.caption = "Minesweeper"
		@diff = 0
		@field = Array.new(8) {Array.new(8,0)}
		@font = Gosu::Font.new(24)
	end

	def draw
		#Draws unopend Squares
		for row in 0...8
			for column in 0...8
				draw_unopened(row,column)
			end
		end

		#Draws opened Square
		#TODO
		#Center the Square for Text
		for row in 0...4
			for column in 0...8
				draw_opened(row,column)
			end
		end
		
	end

	def update

	end

	def button_down(id)
		
	end

	def draw_unopened(row, column)
		#Horizontal White Rect (Long)
		c = Gosu::Color.argb(0xff_ffffff)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 29
		y2 = y1
		x3 = x2
		y3 = y2 + 1
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Horizontal White Rect (Short)
		c = Gosu::Color.argb(0xff_ffffff)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 28
		y2 = y1
		x3 = x2
		y3 = y2 + 2
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Vertical White Column (Long)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 1
		y2 = y1
		x3 = x2
		y3 = y2 + 29
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Vertical White Column (Short)
		x1 = 83 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 1
		y2 = y1
		x3 = x2
		y3 = y2 + 28
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)
		
		#Dark Grey Horizontal Rectangle (long)
		c = Gosu::Color.argb(0xaa626567)
		x1 = 83 + column * 30
		y1 = 111 + row * 30
		#point = point + indent
		x2 = x1 + 29
		y2 = y1
		x3 = x2
		y3 = y2 + 1
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Dark Grey Horizontal Rectangle (Short)
		x1 = 84 + column * 30
		y1 = 110 + row * 30
		#point = point + indent
		x2 = x1 + 28
		y2 = y1
		x3 = x2
		y3 = y2 + 1
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Dark Grey Verticle Rectangle (Long)
		x1 = 110 + column * 30
		y1 = 82 + row * 30
		#point = point + indent
		x2 = x1 + 1
		y2 = y1
		x3 = x2
		y3 = y2 + 29
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Dark Grey Horizontal Rectangle (Short)
		x1 = 111 + column * 30
		y1 = 83 + row * 30
		#point = point + indent
		x2 = x1 + 2
		y2 = y1
		x3 = x2
		y3 = y2 + 28
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Center Light Grey Square
		
		c = Gosu::Color.argb(0xffA8A8A8)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 28
		y2 = y1
		x3 = x2
		y3 = y2 + 28
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 1)
	end

	def draw_opened(row, column)
		c = Gosu::Color.argb(0xffA8A8A8)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 29
		y2 = y1
		x3 = x2
		y3 = y2 + 29
		x4 = x1
		y4 = y3
		draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 3)
		x_center = x1 + 15
		x_text = x_center - @font.text_width("2") / 2
		y_text = y1 + 4
		@font.draw("2",x_text,y_text, 4)
	end
end

window = Minesweeper.new
window.show
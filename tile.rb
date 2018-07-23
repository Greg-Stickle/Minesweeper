require 'gosu'
class Tile

	attr_reader :row, :column, :number, :status

	def initialize(window, row, column, number)
		@@window ||= window
		@row = row
		@column = column
		@number = number
		@status = 0
		@font = Gosu::Font.new(24)
	end

	def setNumber(number)
		@number = number
	end

	def setStatus(status)
		@status = status
	end

	def draw
		case @status
		#Unopened
		when 0
			draw_unopened(@row,@column)
		#Flagged
		when 1
			draw_unopened_flagged(@row,@column)
		#Opened
		when 2
			if @number == 9
				draw_opened_mine(@row,@column)
				
			else
				draw_opened_number(@row,@column,@number)
			end
		end
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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Vertical White Column (Long)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 1
		y2 = y1
		x3 = x2
		y3 = y2 + 29
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Vertical White Column (Short)
		x1 = 83 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 1
		y2 = y1
		x3 = x2
		y3 = y2 + 28
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)
		
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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 1)
	end

	def draw_unopened_flagged(row, column)
		#Tile Code
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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Vertical White Column (Long)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 1
		y2 = y1
		x3 = x2
		y3 = y2 + 29
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Vertical White Column (Short)
		x1 = 83 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 1
		y2 = y1
		x3 = x2
		y3 = y2 + 28
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)
		
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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

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
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 1)

		#Flag
		#Pole
		c = Gosu::Color.argb(0xaa000000)
		x1 = 90 + column * 30
		y1 = 88 + row * 30
		x2 = x1 + 2
		y2 = y1
		x3 = x2
		y3 = y2 + 18
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)

		#Flag
		c = Gosu::Color.argb(0xaaFF0000)
		x1 = 92 + column * 30
		y1 = 88 + row * 30
		x2 = x1 + 14
		y2 = y1
		x3 = x2
		y3 = y2 + 10
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)
	end

	def draw_opened_number(row, column, number)
		c = Gosu::Color.argb(0xffA8A8A8)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 29
		y2 = y1
		x3 = x2
		y3 = y2 + 29
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 3)
		if number == 0
		else
			x_center = x1 + 15
			x_text = x_center - @font.text_width(number) / 2
			y_text = y1 + 4
			@font.draw("#{number}",x_text,y_text, 4)
		end
	end

	def draw_opened_mine(row,column)
		#Draws Opened Square
		c = Gosu::Color.argb(0xffA8A8A8)
		x1 = 82 + column * 30
		y1 = 82 + row * 30
		x2 = x1 + 29
		y2 = y1
		x3 = x2
		y3 = y2 + 29
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 3)

		#Mine Rect
		#Main Square
		c = Gosu::Color.argb(0xaa000000)
		x1 = 89	+ column * 30
		y1 = 89 + row * 30
		x2 = x1 + 14
		y2 = y1
		x3 = x2
		y3 = y1 + 14
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 4)

		#Vertical Black Rect
		x1 = 87	+ column * 30
		y1 = 95 + row * 30
		x2 = x1 + 18
		y2 = y1
		x3 = x2
		y3 = y1 + 2
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 4)

		#Horizontal Black Rect
		x1 = 95	+ column * 30
		y1 = 87 + row * 30
		x2 = x1 + 2
		y2 = y1
		x3 = x2
		y3 = y1 + 18
		x4 = x1
		y4 = y3
		@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 4)
	end	
end
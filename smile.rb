require 'gosu'

class Smile

	def initialize(window, x, y)
		@window = window
		@x = x
		@y = y
		@status = 0
	end

	def draw
		case @status
		#Smile
		when 0
			draw_smile(@x,@y)
		#Dead
		when 1
			draw_dead(@x,@y)
		#Won
		when 2
			draw_won(@x,@y)
	end

	def draw_smile(x,y)
		
	end

	def draw_dead(x,y)

	end

	def draw_won(x,y)

	end
end
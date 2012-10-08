class Chess
	attr_accessor :board, :occupied_spaces, :captives

	def initialize
		@board = {
			:white => {
				:rook_1 =>   "a1",
				:knight_1 => "b1",
				:bishop_1 => "c1",
				:queen =>  "d1",
				:king =>   "e1",
				:bishop_2 => "f1",
				:knight_2 => "g1",
				:rook_2 =>   "h1",
				:pawn_1 =>   "a2",
                :pawn_2 =>   "b2",
                :pawn_3 =>   "c2",
                :pawn_4 =>   "d2",
                :pawn_5 =>   "e2",
                :pawn_6 =>   "f2",
                :pawn_7 =>   "g2",
                :pawn_8 =>   "h2",

			},
			:black => {
				:rook_1 =>   "a8",
				:knight_1 => "b8",
				:bishop_1 => "c8",
                :queen =>  "d8",
                :king =>   "e8",
                :bishop_2 => "f8",
                :knight_2 => "g8",
                :rook_2 =>   "h8",
                :pawn_1 =>   "a7",
                :pawn_2 =>   "b7",
                :pawn_3 =>   "c7",
                :pawn_4 =>   "d7",
                :pawn_5 =>   "e7",
                :pawn_6 =>   "f7",
                :pawn_7 =>   "g7",
                :pawn_8 =>   "h7",
			} 						
		}

		@captives = {
			:white => [],
			:black => []
		}

		@occupied_spaces = @board[:white].map {|k,v| v } + @board[:black].map {|k,v| v }

	end

	def is_valid_move(start,finish,acceptable)
		if (finish.split(/[a-z]/).last.to_i - start.split(/[a-z]/).last.to_i).abs <= acceptable			
			return true
		else
			return false
		end
	end

	def move_a_piece(color,start,finish)
		begin
		  side = @board[color.to_sym]
		  piece = side.select {|k,v| v == start}
		  side[piece.keys.first] = finish
		  @occupied_spaces.delete_if {|k| k == start}
		  @occupied_spaces.push(finish)
		  return true
		rescue Exception => e
		  puts e.message "invalid move? #{e.message}"
		  return false
		end
	end

	def pawn_advance(color,start,finish)

		if @occupied_spaces.include?(finish)
		  puts "you can't move onto a space that is occupied"
		  return false	
		elsif start.split(/\d/) != finish.split(/\d/) 
		  puts "you must move in a single file!"
		  return false
		elsif color == "black" and start.split(/[a-z]/).last == "7"
		  move_a_piece(color,start,finish) if is_valid_move(start,finish,2)				  
		elsif color == "white" and start.split(/[a-z]/).last == "2"
			move_a_piece(color,start,finish) if is_valid_move(start,finish,2)		  
		else 
		  move_a_piece(color,start,finish) if is_valid_move(start,finish,1)					    
		end	

	end

	def pawn_capture(color,start,finish)
		if @occupied_spaces.include?(finish)
			captive_piece = {}
			if color == "black"
			  moving_piece = @board[color.to_sym].select {|k,v| v == start}	
			  captive_piece = @board[:white].select {|k,v| v == finish}	

			  # piece = side.select {|k,v| v == start}
		  	  # side[piece.keys.first] = finish
			elsif color == "white"	
			  moving_piece = @board[color.to_sym].select {|k,v| v == start}	
			  captive_piece = @board[:black].select {|k,v| v == finish}	

			  @board[color.to_sym][moving_piece.keys.first] = finish
			  @board[:black][captive_piece.keys.first] = "captive"			  
			  # piece = side.select {|k,v| v == start}
		  	  #  side[piece.keys.first] = finish
			  	
			else 
			end	
				
			@captives[color.to_sym].push captive_piece
			return true
		else
			return false			
		end	
	end	
end
require 'rspec'
require './chess.rb'



describe Chess, "Should start out with a chess board" do
  before(:each) do
    @chess = Chess.new
  end

  it "should give us a starting chess board " do
    @chess.board.should == {:white=>{:rook_1=>"a1", :knight_1=>"b1", :bishop_1=>"c1", :queen=>"d1", :king=>"e1", :bishop_2=>"f1", :knight_2=>"g1", :rook_2=>"h1", :pawn_1=>"a2", :pawn_2=>"b2", :pawn_3=>"c2", :pawn_4=>"d2", :pawn_5=>"e2", :pawn_6=>"f2", :pawn_7=>"g2", :pawn_8=>"h2"}, :black=>{:rook_1=>"a8", :knight_1=>"b8", :bishop_1=>"c8", :queen=>"d8", :king=>"e8", :bishop_2=>"f8", :knight_2=>"g8", :rook_2=>"h8", :pawn_1=>"a7", :pawn_2=>"b7", :pawn_3=>"c7", :pawn_4=>"d7", :pawn_5=>"e7", :pawn_6=>"f7", :pawn_7=>"g7", :pawn_8=>"h7"}}
  end

  it "should advance a white pawn" do
    advance = @chess.pawn_advance("white","a2","a4")
    advance.should == true
    @chess.board.should == {:white=>{:rook_1=>"a1", :knight_1=>"b1", :bishop_1=>"c1", :queen=>"d1", :king=>"e1", :bishop_2=>"f1", :knight_2=>"g1", :rook_2=>"h1", :pawn_1=>"a4", :pawn_2=>"b2", :pawn_3=>"c2", :pawn_4=>"d2", :pawn_5=>"e2", :pawn_6=>"f2", :pawn_7=>"g2", :pawn_8=>"h2"}, :black=>{:rook_1=>"a8", :knight_1=>"b8", :bishop_1=>"c8", :queen=>"d8", :king=>"e8", :bishop_2=>"f8", :knight_2=>"g8", :rook_2=>"h8", :pawn_1=>"a7", :pawn_2=>"b7", :pawn_3=>"c7", :pawn_4=>"d7", :pawn_5=>"e7", :pawn_6=>"f7", :pawn_7=>"g7", :pawn_8=>"h7"}}    
  end	
  
  it "should not allow a white pawn to adfance outside column" do
    advance = @chess.pawn_advance("white","a2","b4")
    advance.should == false
    @chess.board.should == {:white=>{:rook_1=>"a1", :knight_1=>"b1", :bishop_1=>"c1", :queen=>"d1", :king=>"e1", :bishop_2=>"f1", :knight_2=>"g1", :rook_2=>"h1", :pawn_1=>"a2", :pawn_2=>"b2", :pawn_3=>"c2", :pawn_4=>"d2", :pawn_5=>"e2", :pawn_6=>"f2", :pawn_7=>"g2", :pawn_8=>"h2"}, :black=>{:rook_1=>"a8", :knight_1=>"b8", :bishop_1=>"c8", :queen=>"d8", :king=>"e8", :bishop_2=>"f8", :knight_2=>"g8", :rook_2=>"h8", :pawn_1=>"a7", :pawn_2=>"b7", :pawn_3=>"c7", :pawn_4=>"d7", :pawn_5=>"e7", :pawn_6=>"f7", :pawn_7=>"g7", :pawn_8=>"h7"}}    
  end	

  it "should advance a black pawn" do
    advance = @chess.pawn_advance("black","b7","b5")
    advance.should == true
    @chess.board.should == {:white=>{:rook_1=>"a1", :knight_1=>"b1", :bishop_1=>"c1", :queen=>"d1", :king=>"e1", :bishop_2=>"f1", :knight_2=>"g1", :rook_2=>"h1", :pawn_1=>"a2", :pawn_2=>"b2", :pawn_3=>"c2", :pawn_4=>"d2", :pawn_5=>"e2", :pawn_6=>"f2", :pawn_7=>"g2", :pawn_8=>"h2"}, :black=>{:rook_1=>"a8", :knight_1=>"b8", :bishop_1=>"c8", :queen=>"d8", :king=>"e8", :bishop_2=>"f8", :knight_2=>"g8", :rook_2=>"h8", :pawn_1=>"a7", :pawn_2=>"b5", :pawn_3=>"c7", :pawn_4=>"d7", :pawn_5=>"e7", :pawn_6=>"f7", :pawn_7=>"g7", :pawn_8=>"h7"}}    
  end	

  it "should capture a pawn" do
  	advance = @chess.pawn_advance("white","a2","a4")
  	advance = @chess.pawn_advance("black","b7","b5")
  	capture = @chess.pawn_capture("white","a4","b5")
    capture.should == true
    @chess.board.should == {:white=>{:rook_1=>"a1", :knight_1=>"b1", :bishop_1=>"c1", :queen=>"d1", :king=>"e1", :bishop_2=>"f1", :knight_2=>"g1", :rook_2=>"h1", :pawn_1=>"b5", :pawn_2=>"b2", :pawn_3=>"c2", :pawn_4=>"d2", :pawn_5=>"e2", :pawn_6=>"f2", :pawn_7=>"g2", :pawn_8=>"h2"}, :black=>{:rook_1=>"a8", :knight_1=>"b8", :bishop_1=>"c8", :queen=>"d8", :king=>"e8", :bishop_2=>"f8", :knight_2=>"g8", :rook_2=>"h8", :pawn_1=>"a7", :pawn_2=>"captive", :pawn_3=>"c7", :pawn_4=>"d7", :pawn_5=>"e7", :pawn_6=>"f7", :pawn_7=>"g7", :pawn_8=>"h7"}}    
  	@chess.captives.should == {:white=>[{:pawn_2=>"b5"}], :black=>[]}
  end

end
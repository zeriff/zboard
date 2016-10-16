module BoardsHelper
  def initiate_boards_for_user
    default_boards = ['YouTube', 'Instagrame', 'Vine', 'FaceBook'].freeze
    default_boards.each do |board|
      build_board(board)
    end
  end
  private
  def build_board(board_name)
    @board = self.boards.build({ name: board_name })
    @board.save
  end
end

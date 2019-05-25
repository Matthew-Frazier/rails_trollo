class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy 

  def self.all_lists(board_id)
    List.find_by_sql("
      SELECT *
      FROM lists AS l 
      WHERE #{board_id} = l.board_id 
    ")
  end 

  def self.single_board(board_id)
    Board.find_by_sql("
      SELECT * 
      FROM boards
      WHERE id = #{board_id}
    ").first  
  end 

  def self.single_list(board_id, id) 
    List.find_by_sql(["
    SELECT * 
    FROM lists AS l 
    WHERE l.id = ? AND l.board_id = ? 
    ", id, board_id]).first
  end 

end
class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    #Action Record
    # @lists = @board.lists
    #SQL 
    @lists = List.all_lists(@board.id)
  end

  def show
  end

  def new
    @list = @board.lists.new 
  end

  def create 
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to board_lists_path(@board)
    else 
      render :new 
    end 
  end 

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to board_list_path(@board, @list)
    else
      render :edit
    end 
  end 

  def destroy
    @list.destroy
    redirect_to board_lists_path(@board)

  end 

  private 
  def set_board
    #Active Record 
    # @board = Board.find(params[:board_id])
    #SQL 
    @board = Board.single_board(params[:board_id])
  end 

  def set_list 
    # Active Record 
    # @list = List.find(params[:id])

    #SQL 
    @list = List.single_list(@board.id, params[:id])
  end 

  def list_params 
    params.require(:list).permit(:name)
  end 
end
class BoardsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

	def index
	end

	def new
		@board = Board.new
	end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = "Board created!"
    end
		redirect_to root_url
  end

  def destroy
  end

  private

    def board_params
      params.require(:board).permit(:name)
    end

end

class MessageBoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message_board, only: %i[ show edit update destroy ]

  # GET /message_boards or /message_boards.json
  def index
    @message_boards = MessageBoard.all
  end

  # GET /message_boards/1 or /message_boards/1.json
  def show
    @messages = @message_board.messages
  end

  # GET /message_boards/new
  def new
    @message_board = MessageBoard.new
  end

  # GET /message_boards/1/edit
  def edit
  end

  # POST /message_boards or /message_boards.json
  def create
    @message_board = MessageBoard.new(message_board_params)

    respond_to do |format|
      if @message_board.save
        format.html { redirect_to @message_board, notice: "Message board was successfully created." }
        format.json { render :show, status: :created, location: @message_board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_boards/1 or /message_boards/1.json
  def update
    respond_to do |format|
      if @message_board.update(message_board_params)
        format.html { redirect_to @message_board, notice: "Message board was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @message_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_boards/1 or /message_boards/1.json
  def destroy
    @message_board.destroy!

    respond_to do |format|
      format.html { redirect_to message_boards_path, notice: "Message board was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_board
      @message_board = MessageBoard.friendly.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def message_board_params
      params.expect(message_board: [ :name, :user_id ])
    end
end

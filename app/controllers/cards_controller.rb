class CardsController < ApplicationController
  before_action :set_card, only: %i[ show edit update destroy move ]

  # GET /cards or /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1 or /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:list_id])

    @card = @list.cards.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @board, notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

# PATCH/PUT /cards/1 or /cards/1.json
def update
  respond_to do |format|
    if @card.update(card_params)
      format.html { redirect_to @card.list.board, notice: "Card atualizado com sucesso.", status: :see_other }
      format.json { render :show, status: :ok, location: @card }
    else
      format.html { render :edit, status: :unprocessable_content }
      format.json { render json: @card.errors, status: :unprocessable_content }
    end
  end
end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @board = @card.list.board

    @card.destroy!

    respond_to do |format|
      format.html do
        redirect_to @board,
                    notice: "Card was successfully destroyed.",
                    status: :see_other
      end

      format.json { head :no_content }
    end
  end

  # PATCH /boards/:board_id/lists/:list_id/cards/:id/move
  def move
    target_list = List.find(move_params[:list_id])
    new_position = move_params[:position].to_i

    @card.transaction do
      old_list = @card.list

      # Remove o card da posição antiga, fechando o buraco
      old_list.cards.where("position > ?", @card.position)
              .update_all("position = position - 1")

      # Abre espaço na lista de destino a partir da nova posição
      target_list.cards.where("position >= ?", new_position)
                 .update_all("position = position + 1")

      @card.update!(list_id: target_list.id, position: new_position)
    end

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.expect(card: [ :title, :list_id ])
    end

    def move_params
      params.expect(card: [ :list_id, :position ])
    end
end

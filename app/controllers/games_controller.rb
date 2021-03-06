class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  # GET /games
  # GET /games.json
  def index
    @games_completed = Game.where("completed": true).order(completed_date: :desc).limit(20)
    @games_recent = Game.where("completed": false).order(created_at: :desc).limit(20)
  end

  def search
    if params[:q].blank?
      redirect_to(root_path) and return
    else
      parameter = params[:q].downcase
      @results = Game.all.where("lower(title) LIKE :query", query: "%#{parameter}%")
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
  end

  # GET /games/new
  def new
    @game = Game.new
    @platforms = Platform.order(:manufacturer)
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    @platforms = Platform.order(:manufacturer)
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:title,
        :edition,
        :release_date,
        :in_collection,
        :buy_date,
        :completed,
        :completed_date,
        :thumbnail,
        :platform_id,
        :rating,
        :comment)
    end
end

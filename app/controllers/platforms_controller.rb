class PlatformsController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @platforms = Platform.all
  end

  def show
    @platform = Platform.find(params[:id])
    @games = Game.where(platform_id: params[:id])
  end

  def new
    @platform = Platform.new
  end

  def edit
    @platform = Platform.find(params[:id])
  end

  def create
    @platform = Platform.new(platform_params)

    respond_to do |format|
      if @platform.save
        format.html { redirect_to platforms_path, notice: 'Platform was successfully created.' }
        format.json { render :show, status: :created, location: @platform }
      else
        format.html { render :new }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.html { redirect_to platforms_path, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @platform }
      else
        format.html { render :edit }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @platform.destroy
    respond_to do |format|
      format.html { redirect_to platforms, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @platform = Platform.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def platform_params
      params.require(:platform).permit(:name, :manufacturer)
    end
end

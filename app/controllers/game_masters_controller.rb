class GameMastersController < ApplicationController
    before_action :find_game_master, only: [:show, :edit, :update, :destroy]
    def index
        @game_masters = GameMaster.all
    end

    def show
    end

    def new
        @game_master = GameMaster.new
    end

    def create
        @game_master = GameMaster.create(game_master_params)
        redirect_to @game_master
    end

    def edit
    end

    def update
        @game_master.update(game_master_params)
        redirect_to @game_master
    end

    def destroy 
        @game_master.destroy
    end

    private

    def find_game_master
        @game_master = GameMaster.find(params[:id])
    end
    def game_master_params
        params.require(:game_master).permit(:name, :image)
    end
end

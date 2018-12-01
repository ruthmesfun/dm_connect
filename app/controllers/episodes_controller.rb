class EpisodesController < ApplicationController
    before_action :find_episode, only: [:show, :edit, :update, :destroy]
    before_action :find_game_master, only: [:new, :create, :edit, :update, :show]
    before_action :find_campaign, only: [:new, :create, :edit, :update, :show]
    def index
        @episodes = Episode.all
    end

    def new
        @episode = @campaign.episodes.build
    end

    def create
        @episode = @campaign.episodes.create(episode_params)
        @episode.game_master = @game_master
        @episode.save
        redirect_to game_master_campaign_episode_path(@game_master, @campaign, @episode)
    end

    def edit
    end

    def update
        @episode.update(episode_params)
        redirect_to @episode
    end

    def show
    end

    def destroy 
        @episode.destroy
    end

    private
    def find_game_master
        @game_master = GameMaster.find(params[:game_master_id])
    end
    def find_campaign
        @campaign = Campaign.find(params[:campaign_id])
    end
    def find_episode
        @episode = Episode.find(params[:id])
    end
    def episode_params
        params.require(:episode).permit(:title, :game_master_id, :campaign_id, :date, :summary, :notes, :setting_id)
    end
end

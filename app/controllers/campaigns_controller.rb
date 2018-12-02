class CampaignsController < ApplicationController
    before_action :find_campaign, only: [:show, :edit, :update, :destroy]
    before_action :find_game_master, only: [:new, :create, :edit, :update, :show]
    def index
        @campaigns = Campaign.all
        @game_masters = GameMaster.all
    end

    def new
        @campaign =@game_master.campaigns.build
        @campaign.episodes.build
    end

    def create
        @episode = @game_master.episodes.build(campaign_params['episodes_attributes']['0'])
        @episode.save
        @campaign = @game_master.campaigns.build(title: campaign_params[:title])
        @campaign.save
        @campaign.episodes << @episode

        @campaign.save
        @episode.save
        @game_master.save

        redirect_to game_master_campaign_path(@game_master,@campaign)
    end

    def edit
    end

    def update
        @campaign.update(campaign_params)
        redirect_to @campaign
    end

    def show
    end

    def destroy 
        @campaign.destroy
    end

    private
    def find_game_master
        @game_master = GameMaster.find(params[:game_master_id])
    end
    def find_campaign
        @campaign = Campaign.find(params[:id])
    end
    def campaign_params
        params.require(:campaign).permit(:id, :title, :game_master_id, :episodes_attributes =>[:id,:title, :game_master_id, :campaign_id, :date, :summary, :notes, :_destroy])
    end
end

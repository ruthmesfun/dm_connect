class CampaignsController < ApplicationController
    before_action :find_campaign, only: [:show, :edit, :update, :destroy]
    before_action :find_game_master, only: [:new, :create, :edit, :update, :show]
    def index
        @campaigns = Campaign.all
    end

    def new
        @campaign = @game_master.campaigns.build
    end

    def create
        @campaign = @game_master.campaigns.create(campaign_params)

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
        params.require(:campaign).permit(:title, :game_master, settings:[], episodes:[])
    end
end

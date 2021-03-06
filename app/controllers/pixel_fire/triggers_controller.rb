require_dependency "pixel_fire/application_controller"

module PixelFire
  class TriggersController < ApplicationController
    before_action :set_trigger, only: [:show, :edit, :update, :destroy]

    # GET /triggers
    def index
      @triggers = Trigger.all
    end

    # GET /triggers/1
    def show
    end

    # GET /triggers/new
    def new
      @trigger = Trigger.new
    end

    # GET /triggers/1/edit
    def edit
    end

    # POST /triggers
    def create
      @trigger = Trigger.new(trigger_params)

      if @trigger.save
        @trigger.update_tags(params[:tag_ids])
        redirect_to @trigger, notice: 'Trigger was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /triggers/1
    def update
      if @trigger.update(trigger_params)
        @trigger.update_tags(params[:tag_ids])
        redirect_to @trigger, notice: 'Trigger was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /triggers/1
    def destroy
      @trigger.destroy
      redirect_to triggers_url, notice: 'Trigger was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_trigger
        @trigger = Trigger.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def trigger_params
        params.require(:trigger).permit(:name, :fire_on_all_pages, :page_url)
      end
  end
end

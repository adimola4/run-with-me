class PartnersController < ApplicationController
    def create
      @partner = Partner.new(partner_params)
      @partner.training_id = params[:training_id]
      @partner.user_id = current_user.id
  
      if @partner.save
        redirect_to request.referrer, notice: 'partner was successfully created.'
      else
        redirect_to request.referrer, alert: @partner.errors.full_messages.join('. ').to_s
      end
    end
  
    private
  
    def partner_params
      params.require(:partner)
    end
  end
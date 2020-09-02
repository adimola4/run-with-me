class PartnersController < ApplicationController

    

    def create
      @partner = current_user.partners.new(training_id:  params[:training_id])
      t = @partner.save
      if t
        redirect_to request.referrer, notice: 'partner was successfully created.'
      else
        redirect_to request.referrer, alert: @partner.errors.full_messages.join('. ').to_s
      end
    end
    def destroy
      partner = Partner.find_by(id: params[:id], user: current_user, training_id: params[:training_id])
      if partner
        partner.destroy
        redirect_to request.referrer, notice: 'You remove from the this training.'
      else
        redirect_to request.referrer, alert: 'You cannot remove from this training.'
      end
    end
    def show
      @partner = Partner.find(params[:id])
    end
  end
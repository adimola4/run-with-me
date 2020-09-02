class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
      @trainings = @user.trainings.ordered_by_most_recent
      @partners_tranings =  @user.partners.upcoming2(@user.id)
      p "######################"
      @upcoming_tranings=Array.new
      i = 0
      @partners_tranings.each{|partner, | 
      @upcoming_tranings[i] = Training.where(id:partner.training_id).upcoming
        i+=1
        p i
      }
      p @upcoming_tranings
    
      end
  
 ##   def pending_friends
     # @users = current_user.pending_friends
    #end
  
    #def friend_requests
   #   @users = current_user.friend_requests
  #  end
  end
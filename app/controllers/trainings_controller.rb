class TrainingsController < ApplicationController
  before_action :authenticate_user!


  # GET /trainings
  # GET /trainings.json
  def index
        @training = Training.new
        public_trainings
        #Rails.logger.info "DEBUG:: "+public_trainings.to_s()
    
    end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    @training = Training.find(params[:id])
    partners
  end

  # GET /trainings/new
  def new
    @training = Training.new
    @training.status = 0;
    
     
  end

  # GET /trainings/1/edit
  def edit
    @training = Training.find(params[:id])

  end

  # POST /trainings
  # POST /trainings.json
  def create
    @user=current_user
    str = training_params[:date].gsub(/\s+/m, ' ').strip.split(" ")
    r=str[1]+str[0]
    date=r.to_date()
    @training =@user.trainings.new(training_params)
    @training.status = 0
    @training.date=date
    respond_to do |format|
      if @training.save
        format.html { redirect_to trainings_path, notice: 'Training was successfully created.' }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    @user=current_user
    @training =@user.trainings.find(params[:id])
    respond_to do |format| 
      if @training
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: 'Training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # trainings#search
  def search
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @term = params[:search] 
      # TODO change title to zipcode
      @results = Training.all.where("lower(title) LIKE :search", search: @term.downcase )  
      @users_results = User.all.where("lower(name) LIKE :search", search: @term.downcase )
        
    end
end

  private

    # partners
    def partners
      @partners = Partner.where(training_id: params[:id])
      if @partners == []
       @partners = Partner.new
      end
    end
    # training public list
    def public_trainings
      @public_trainings ||= users_public_trainings.ordered_by_most_recent
    end

    def users_public_trainings
      Training.where(public: true).or(Training.where(user_id: current_user.id))
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:title, :date, :duration, :participants, :user_id, :location, :public, :details, :training_type, :zipcode)
    end
end

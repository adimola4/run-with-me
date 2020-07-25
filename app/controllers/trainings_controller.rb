class TrainingsController < ApplicationController
  before_action :authenticate_user!


  # GET /trainings
  # GET /trainings.json
  def index
    @training = Training.new
    public_trainings
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @training = Training.new
    @training.status = 0;
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @user=current_user
    @training =@user.trainings.new(training_params)
    @training.status = 0;
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
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
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

  private
    # training public list
    def public_trainings
      @public_trainings ||= users_public_trainings.ordered_by_most_recent
    end

    def users_public_trainings
      Training.where(published: true).or(Training.where(user_id: current_user.id))
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:title, :date, :duration, :participants, :user_id, :Location, :published)
    end
end

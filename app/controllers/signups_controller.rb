class SignupsController < ApplicationController
  before_action :set_signup, only: [:show, :edit, :update, :destroy]
  before_action :new_signup, only: [:index, :show, :new]
  respond_to :html, :js

  # GET /signups
  # GET /signups.json
  def index
    @signups = Signup.all
    @shifts = Shift.all
    @marshall_shifts = Shift.where(shift_type: 'marshall')
  end

  def available_signups

  end

  # GET /signups/1
  # GET /signups/1.json
  def show
  end

  # GET /signups/new
  def new
  end

  # GET /signups/1/edit
  def edit
  end

  # POST /signups
  # POST /signups.json
  def create
    @signup = Signup.new(signup_params)

    respond_to do |format|
      if @signup.save
        # redirect to current_page? given that there might be different views
        format.html { redirect_to root_path, notice: 'Successfully signed up, thanks!' }
        # format.json { render :show, status: :created, location: @signup }
        format.js
      else
        format.html { render :new }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /signups/1
  # PATCH/PUT /signups/1.json
  def update
    respond_to do |format|
      if @signup.update(signup_params)
        format.html { redirect_to @signup, notice: 'Signup was successfully updated.' }
        format.json { render :show, status: :ok, location: @signup }
      else
        format.html { render :edit }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    @signup.destroy
    respond_to do |format|
      format.html { redirect_to signups_url, notice: 'Signup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def new_signup
      @new_signup = Signup.new
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      @signup = Signup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signup_params
      params.require(:signup).permit(:name, :email, :phone_number, :shift_id, :team_affiliation)
    end
end

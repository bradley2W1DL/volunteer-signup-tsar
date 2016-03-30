class SignupsController < ApplicationController
  before_action :set_signup, only: [:show, :edit, :update, :destroy]
  before_action :new_signup, only: [:index, :show, :new, :create]
  respond_to :html, :js

  # GET /signups
  # GET /signups.json
  def index
    if params[:shift_type]
      @shift_type = params[:shift_type].to_s
      if params[:shift_type] == 'all_available'
        @shifts = Shift.find(Shift.available_shift_ids)
      else
        @shifts = Shift.where(shift_type: @shift_type)
      end
    else
      @shifts = Shift.all
      @shift_type = 'all'
    end
  end

  def edit_request
    signup = Signup.find(params[:signup_id])
    request = { name: params[:name], message: params[:message] }
    if VolunteerMailer.edit_request_email(signup, request).deliver_now
      flash[:notice] = 'Message Sent, we\'ll get back to you as soon as we can'
      Message.create(sender_name: request[:name], sender_email: signup.email, message: request[:message], signup_id: signup.id)
    else
      flash[:error] = 'an error occurred when trying to send message'
    end
    redirect_to :back
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
    @shift_type = Shift.find(@signup.shift_id).shift_type
    @shifts = Array(Shift.find(@signup.shift_id))

    respond_to do |format|
      if @signup.save
        flash.now[:notice] = 'Successfully signed up'
        format.html { render :index }
        # format.html { redirect_to :back, notice: 'Successfully signed up' }
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

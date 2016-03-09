class ShiftsController < ApplicationController

  def fetch_shifts
    @new_signup = Signup.new
    @shift_type = params[:shift_type].to_s
    if @shift_type == 'all'
      @shifts = Shift.all
    else
      @shifts = Shift.where(shift_type: @shift_type)
    end
    respond_to do |format|
      format.html { render 'signups/index'}
      format.js
    end
  end
end
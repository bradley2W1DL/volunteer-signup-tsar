# Might be unnecessary

# class ShiftsController < ApplicationController
#   def index
#   end
#
#   def show
#   end
#
#   def create
#     @shift = Shift.new(shift_params)
#
#     respond_to do |format|
#       if @shift.save
#         format.html { redirect_to root_path, notice: 'Successfully signed up, thanks!' }
#         format.json { render :show, status: :created, location: @shift }
#       else
#         format.html { redirect_to root_path, error: 'Unsuccessful shift creation' }
#         format.json { render json: @shift.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#   def destroy
#   end
#
#   private
#
#   def shift_params
#     require(:shift).permit(:name, :shift_time, :required_number, :shift_type)
#   end
#
#   def set_shift
#     @shift = Shift.find(params[:id])
#   end
# end
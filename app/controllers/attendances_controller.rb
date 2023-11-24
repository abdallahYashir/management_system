class AttendancesController < ApplicationController
  def create
    # TODO: check if current user
    # TODO: create attendance
    # if true -> display success message
    # if false -> display error message based on validation
    params = permitted_params
    pp "params: #{params}"
  end

  def destroy
  end

  private

  def permitted_params
    params.permit(:user, :date)
  end

end

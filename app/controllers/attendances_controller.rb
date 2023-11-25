class AttendancesController < ApplicationController
  def create
    user = attendance_params[:user].to_i
    date = attendance_params[:date]

    pp "date: #{date.class}"
    return unless current_user.id == user

    # @attendance = Attendance.new(user_id: user, date: permitted_params[:date])

    # @attendance = Attendance.new(attendance_params)

    # if @attendance.save
    #   # handle a successful save
    # else
    #   # handle an unsuccessful save
    # end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user, :date)
  end
end

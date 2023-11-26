class AttendancesController < ApplicationController
  def create
    user = attendance_params[:user].to_i
    date = Date.parse(attendance_params[:date])

    return unless current_user.id == user

    existing_attendance = Attendance.find_by(user: current_user, date: date)

    return if existing_attendance.present?

    @attendance = Attendance.new(user: current_user, date: date)

    if @attendance.save
      flash[:notice] = 'Attendance saved'
      # TODO: maybe use turbolinks to reload the table?
    else
      # handle an unsuccessful save
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user, :date)
    params
  end
end

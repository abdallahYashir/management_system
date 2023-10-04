class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @week_number = Date.current.beginning_of_week.strftime('%V')
    @from_date = Date.current.beginning_of_week.strftime('%A, %d/%m/%Y')
    @to_date = Date.current.end_of_week(:saturday).strftime('%A, %d/%m/%Y')
    dates = (Date.current.beginning_of_week..Date.current.end_of_week(:saturday)).to_a

    @users = User.includes(:attendances).all
    attendances_by_user_id = {}

    @users.each do |user|
      attendances_by_user_id[user.id] = user.attendances.index_by(&:date)
    end

    @users = @users.map do |user|
      {
        employee: user,
        dates: dates.map do |date|
          attendance = attendances_by_user_id[user.id][date]
          present = attendance.present? ? 'check' : 'times'
          colour = attendance.present? ? 'text-green-500' : 'text-red-500'
          {
            date: date,
            present: attendance.presence,
            icon: present,
            colour: colour
          }
        end
      }
    end

    @users = @users.sort_by { |user| user[:employee].firstname }
  end
end

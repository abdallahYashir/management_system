class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @week_number = Date.current.beginning_of_week.strftime('%V')
    @from_date = Date.current.beginning_of_week.strftime('%A, %d/%m/%Y')
    @to_date = Date.current.end_of_week(:saturday).strftime('%A, %d/%m/%Y')
    dates = (Date.current.beginning_of_week..Date.current.end_of_week(:saturday)).to_a

    # TODO: do everything in the controller itself
    # then if possible, move it to the helper

    # TODO: another todo for icon if possible pass the fa_icon itself to the view -- otherwise use the string (one change at a time)

    # Preload attendances for all users and dates
    @users = User.includes(:attendances).all
    attendances_by_user_id = {}

    @users.each do |user|
      attendances_by_user_id[user.id] = user.attendances.index_by(&:date)
    end

    # Construct the data structure
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

    # @users = User.includes(:attendances).all.map do |user|
    #   {
    #     employee: user,
    #     dates: dates.map do |date|
    #       attendance = user.attendances.find_by(date: date)
    #       present = attendance.present? ? 'check' : 'times'
    #       colour = attendance.present? ? 'text-green-500' : 'text-red-500'
    #       {
    #         date: date,
    #         present: attendance.presence,
    #         icon: present,
    #         colour: colour
    #       }
    #     end
    #   }
    # end

    # @users = User.all.includes(:attendances).map do |user|
    #   {
    #     employee: user,
    #     dates: dates.map do |date|
    #       {
    #         date: date,
    #         present: user.attendances.find_by(date: date).presence,
    #         icon: user.attendances.find_by(date: date).presence ? 'check' : 'times',
    #         colour: user.attendances.find_by(date: date).presence ? 'text-green-500' : 'text-red-500'
    #       }
    #     end
    #   }
    # end
    @users = @users.sort_by { |user| user[:employee].firstname }
  end
end

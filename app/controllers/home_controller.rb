class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @week_number = Date.current.beginning_of_week.strftime('%V')
    @from_date = Date.current.beginning_of_week.strftime('%A, %d/%m/%Y')
    @to_date = Date.current.end_of_week(:saturday).strftime('%A, %d/%m/%Y')
    @users = User.all
    # TODO: generate a collection that contains User with all the days of the week
    # { user, date: { day: 'Monday', date: '2019-01-01', day: 'Tuesday' } }
  end
end

class Attendance < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :date, uniqueness: { scope: :user_id }
  # validates :date, on: :create, date_not_in_the_past
  # validates :date, on: :create, date_during_week

  def date_not_in_the_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end

  def date_during_week
    errors.add(:date, "can't be on a weekend") if date.saturday? || date.sunday?
  end

end

class Attendance < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :date, uniqueness: { scope: :user_id }
  validate :date_not_in_the_past, on: :create
  validate :date_during_week, on: :create
  before_create -> { self.present = true }

  def date_not_in_the_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end

  def date_during_week
    errors.add(:date, "can't be on a weekend") if date.saturday? || date.sunday?
  end
end

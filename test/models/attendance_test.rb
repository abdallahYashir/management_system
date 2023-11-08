require "test_helper"

class AttendanceTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
    @attendance = attendances(:one)
  end

  test 'should save attendance successfully' do
    @user = users(:one)
    assert @attendance.valid?
  end

  test 'should be present by default' do
    assert @attendance.present.present?
  end

  test 'should not create attendance in the past' do
    attendance = Attendance.new(date: Date.yesterday, user_id: @user.id)
    assert attendance.invalid?
    assert attendance.errors[:date] == ["can't be in the past"]
  end

  test 'should not create attendance on a weekend' do
    attendance = Attendance.new(date: Date.today.next_occurring(:saturday), user_id: @user.id)
    assert attendance.invalid?
  end
end

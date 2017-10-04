require 'test_helper'

class LossTest < ActiveSupport::TestCase
  def setup
    @loss = losses(:one)
    @date = 5.hours.ago
  end

  test '#save updates assoicated job fnol_received' do
    @loss.job = jobs(:one)
    @loss.fnol_received = @date
    @loss.save
    assert_equal(@date, jobs(:one).fnol_received)
  end

  test '#save does not update fnol_received on job if not present' do
    @loss.job = jobs(:one)
    jobs(:one).update_attributes fnol_received: @date
    @loss.fnol_received = nil
    @loss.save
    assert_equal(@date, jobs(:one).fnol_received)
  end

  test '#save does not complain if no job' do
    @loss.job = nil
    @loss.save
  end
end

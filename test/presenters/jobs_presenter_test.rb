require 'test_helper'

class JobsPresenterTest < ActiveSupport::TestCase
  def setup
    jobs = Job.search(nil).result
    @presenter = JobsPresenter.new(jobs, nil, nil)
  end

  test 'it returns counts for each status' do
    assert_equal 1, @presenter.pending_count
    assert_equal 5, @presenter.active_count
    assert_equal 1, @presenter.invoiced_count
    assert_equal 1, @presenter.dead_count
    assert_equal 0, @presenter.closed_count
  end

  test 'it returns values for each status' do
    assert_equal 9.99, @presenter.pending_value
    assert_equal 9.99, @presenter.active_value
    assert_equal 0, @presenter.invoiced_value
    assert_equal 0, @presenter.dead_value
    assert_equal 0, @presenter.closed_value
  end

  test 'it allows paging' do
    assert @presenter.total_count >= 0
    assert @presenter.total_pages >= 0
    assert @presenter.current_page >= 0
  end
end

require 'test_helper'

class JobPresenterTest < ActiveSupport::TestCase
  def setup
    @presenter = JobPresenter.new(jobs(:one), nil)
  end

  test '#job_manager_names_display returns html_safe string' do
    assert(@presenter.job_manager_names_display.html_safe?)
  end

  test '#job_manager_names_display returns empty string if no managers' do
    presenter = JobPresenter.new(jobs(:no_manager), nil)
    assert_equal '', presenter.job_manager_names_display
  end

  test '#job_manager_names_display returns manager name if one manager' do
    assert_equal users(:one).full_name, @presenter.job_manager_names_display
  end

  test '#job_manager_names_display separates names with br tag if multiple' do
    jobs(:one).job_managers << JobManager.new(job_manager: users(:two))
    assert_match %r{<br \/>}, @presenter.job_manager_names_display
  end
end

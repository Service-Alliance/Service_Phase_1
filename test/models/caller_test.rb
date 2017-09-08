require 'test_helper'

class CallerTest < ActiveSupport::TestCase
  setup do
    @caller = callers(:one)
  end

  test 'Caller#company_name returns an empty string if no companies' do
    assert_equal '', @caller.company_name
  end

  test 'Caller#company_name returns the name of the company if there is only one company' do
    @caller.companies << companies(:one)
    assert_equal companies(:one).name, @caller.company_name
  end

  test 'Caller#company_name returns an empty string if there is more than one company' do
    @caller.companies << [companies(:one), companies(:two)]
    assert_equal '', @caller.company_name
  end

  test 'Caller#company_name= creates a new company if it does not exist' do
    assert_difference ['Company.count', '@caller.companies.count'], 1 do
      @caller.company_name = 'New Company'
    end
    assert_equal 1, @caller.companies.where(name: 'New Company').count
  end

  test 'Caller#company_name= assigns the company but does not create a new one if there already is one by that name' do
    assert_difference 'Company.count', 0 do
      assert_difference '@caller.companies.count', 1 do
        @caller.company_name = companies(:two).name
      end
    end
    assert_equal 1, @caller.companies.where(name: companies(:one).name).count
  end

  test 'Caller#company_name= does not change anything if the company is already assigned' do
    @caller.companies << companies(:one)
    assert_difference ['Company.count', '@caller.companies.count'], 0 do
      @caller.company_name = companies(:one).name
    end
    assert_equal 1, @caller.companies.where(name: companies(:one).name).count
  end
end

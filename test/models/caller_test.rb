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

  test "Caller#add_company doesn't do anything if passed nil" do
    assert_difference '@caller.companies.count', 0 do
      @caller.add_company(nil)
    end
  end

  test "Caller#add_company adds the company if not already there" do
    assert_difference '@caller.companies.count', 1 do
      @caller.add_company(companies(:one))
    end
  end

  test "Caller#add_company doesn't do anything if company already associated" do
    @caller.add_company(companies(:one))
    assert_difference '@caller.companies.count', 0 do
      @caller.add_company(companies(:one))
    end
  end
end

require 'test_helper'

class PricingTest < ActiveSupport::TestCase
  def setup
    @pricing = Pricing.new(non_taxable_amount: 200, taxable_amount: 500, tax_amount: 50, job: jobs(:one))
  end

  test "#subtotal is non_taxable + taxable amounts" do
    assert_equal(700, @pricing.subtotal)
  end

  test "#total is subtotal + tax_amount" do
    assert_equal(750, @pricing.total)
  end

  test "#price is an alias for total" do
    assert_equal(750, @pricing.price)
  end

  test "#tax_rate gets pulled from the job address" do
    assert_equal @pricing.job.caller.address.state.tax_rate, @pricing.tax_rate
  end

  test "#tax_rate defaults to 0 if one of the models in the chain is nil" do
    @pricing.job.caller = nil
    assert_equal 0, @pricing.tax_rate
  end
end

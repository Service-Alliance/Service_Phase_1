require 'test_helper'

class PricingTest < ActiveSupport::TestCase
  def setup
    @pricing = Pricing.new(non_taxable_amount: 200, taxable_amount: 500, tax_amount: 50)
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
end

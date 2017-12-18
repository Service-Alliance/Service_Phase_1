require 'test_helper'

class WorkOrderMailerTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @job = jobs(:one)
    @work_order = work_orders(:one)
  end

  test '#notification' do
    assert_difference 'MailLog.count' do
      email = WorkOrderMailer.notification(@user, @job, @work_order).deliver_now
      assert_not ActionMailer::Base.deliveries.empty?
      assert_equal "Dave Jones, you have been sent a work order for job #{@job.id}, #{@job.name}. Franchise: FranchiseOne.", email.subject()

      email.header.fields.select {|rec| rec.name.eql? "X-SMTPAPI"}.first.value["unique_args"].tap do |header_field|
        assert_equal "work_order", header_field["origin_type"]
        assert_equal @work_order.id, header_field["origin_id"]
      end

      assert_includes email.body.raw_source, "Job Location: #{@job.customer_address_without_county}"
    end
  end

  test '#vendor_notification' do
    assert_difference 'MailLog.count' do
      email = WorkOrderMailer.vendor_notification(@user, @job, @work_order).deliver_now
      assert_not ActionMailer::Base.deliveries.empty?
      assert_equal "Dave Jones, you have been sent a work order from Service Alliance for job, #{@job.name}. Franchise: FranchiseOne.", email.subject()
      email.header.fields.select {|rec| rec.name.eql? "X-SMTPAPI"}.first.value["unique_args"].tap do |header_field|
        assert_equal "work_order", header_field["origin_type"]
        assert_equal @work_order.id, header_field["origin_id"]
      end

      assert_includes email.body.raw_source, "Job Location: #{@job.customer_address_without_county}"
    end
  end

  test '#draft' do
    assert_difference 'MailLog.count' do
      email = WorkOrderMailer.draft(@user, @job, @work_order).deliver_now
      assert_not ActionMailer::Base.deliveries.empty?
      assert_equal "Dave Jones, you have been sent a work order draft for job #{@job.id}, #{@job.name}. Franchise: #{@job.franchise.try(:name)}.", email.subject()
      email.header.fields.select {|rec| rec.name.eql? "X-SMTPAPI"}.first.value["unique_args"].tap do |header_field|
        assert_equal "work_order", header_field["origin_type"]
        assert_equal @work_order.id, header_field["origin_id"]
      end

      assert_includes email.body.raw_source, "Job Location: #{@job.customer_address_without_county}"
    end
  end
end

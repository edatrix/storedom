require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def test_order_has_status
    order = Order.new
    order.status = "submitted"
    assert_equal "submitted", order.status
  end

  def test_order_has_acceptable_status
    order = Order.new
    statuses = ["submitted", "paid", "rejected", "complete"]
    statuses.each do |status|
      order.status = status
      assert order.valid?
    end
  end

  def test_order_is_invalid_with_unacceptable_status
    order = Order.new
    order.status = "unpaid"
    refute order.valid?
  end

end

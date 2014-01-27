require 'test_helper'

class DisplaysOrdersTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  # def test_it_reaches_the_root_page
  #   visit '/'
  #   assert_equal 200, page.status_code

  #   within('h1') do
  #     assert page.has_content?('Items'), "page should have an Items heading"
  #   end
  # end

  def test_it_reaches_orders_page
    visit '/orders'
    assert_equal 200, page.status_code
  end

  def test_page_displays_order_count
    user = User.create
    order_1 = user.orders.create(:status => "submitted")
    order_2 = user.orders.create(:status => "submitted")

    visit '/orders'

    within('h1') do
      assert page.has_content?("2 Orders"), "order count missing from:\n#{page.body}"
    end

  end

end

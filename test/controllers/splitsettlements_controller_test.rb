require "test_helper"

class SplitsettlementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @splitsettlement = splitsettlements(:one)
  end

  test "should get index" do
    get splitsettlements_url
    assert_response :success
  end

  test "should get new" do
    get new_splitsettlement_url
    assert_response :success
  end

  test "should create splitsettlement" do
    assert_difference("Splitsettlement.count") do
      post splitsettlements_url, params: { splitsettlement: { account_name: @splitsettlement.account_name, order_number: @splitsettlement.order_number, payment_status: @splitsettlement.payment_status, product_id: @splitsettlement.product_id, product_name: @splitsettlement.product_name, split_amount: @splitsettlement.split_amount, transaction_id: @splitsettlement.transaction_id } }
    end

    assert_redirected_to splitsettlement_url(Splitsettlement.last)
  end

  test "should show splitsettlement" do
    get splitsettlement_url(@splitsettlement)
    assert_response :success
  end

  test "should get edit" do
    get edit_splitsettlement_url(@splitsettlement)
    assert_response :success
  end

  test "should update splitsettlement" do
    patch splitsettlement_url(@splitsettlement), params: { splitsettlement: { account_name: @splitsettlement.account_name, order_number: @splitsettlement.order_number, payment_status: @splitsettlement.payment_status, product_id: @splitsettlement.product_id, product_name: @splitsettlement.product_name, split_amount: @splitsettlement.split_amount, transaction_id: @splitsettlement.transaction_id } }
    assert_redirected_to splitsettlement_url(@splitsettlement)
  end

  test "should destroy splitsettlement" do
    assert_difference("Splitsettlement.count", -1) do
      delete splitsettlement_url(@splitsettlement)
    end

    assert_redirected_to splitsettlements_url
  end
end

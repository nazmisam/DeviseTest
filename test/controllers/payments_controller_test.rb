require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_product_payments_url
    assert_response :success
  end

  test "should create payment" do
    assert_difference("Payment.count") do
      post payments_url, params: { payment: { buyer_address: @payment.buyer_address, buyer_email: @payment.buyer_email, buyer_name: @payment.buyer_name, buyer_phone: @payment.buyer_phone, product_id: @payment.product_id } }
    end

    assert_redirected_to product_payments_url(Payment.last)
  end

  test "should show payment" do
    get product_payments_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_payments_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch product_payments_url(@payment), params: { payment: { buyer_address: @payment.buyer_address, buyer_email: @payment.buyer_email, buyer_name: @payment.buyer_name, buyer_phone: @payment.buyer_phone, product_id: @payment.product_id } }
    assert_redirected_to product_payments_url(@payment)
  end

  test "should destroy payment" do
    assert_difference("Payment.count", -1) do
      delete product_payments_url(@payment)
    end

    assert_redirected_to payments_url
  end
end

require "application_system_test_case"

class SplitsettlementsTest < ApplicationSystemTestCase
  setup do
    @splitsettlement = splitsettlements(:one)
  end

  test "visiting the index" do
    visit splitsettlements_url
    assert_selector "h1", text: "Splitsettlements"
  end

  test "should create splitsettlement" do
    visit splitsettlements_url
    click_on "New splitsettlement"

    fill_in "Account name", with: @splitsettlement.account_name
    fill_in "Order number", with: @splitsettlement.order_number
    fill_in "Payment status", with: @splitsettlement.payment_status
    fill_in "Product", with: @splitsettlement.product_id
    fill_in "Product name", with: @splitsettlement.product_name
    fill_in "Split amount", with: @splitsettlement.split_amount
    fill_in "Transaction", with: @splitsettlement.transaction_id
    click_on "Create Splitsettlement"

    assert_text "Splitsettlement was successfully created"
    click_on "Back"
  end

  test "should update Splitsettlement" do
    visit splitsettlement_url(@splitsettlement)
    click_on "Edit this splitsettlement", match: :first

    fill_in "Account name", with: @splitsettlement.account_name
    fill_in "Order number", with: @splitsettlement.order_number
    fill_in "Payment status", with: @splitsettlement.payment_status
    fill_in "Product", with: @splitsettlement.product_id
    fill_in "Product name", with: @splitsettlement.product_name
    fill_in "Split amount", with: @splitsettlement.split_amount
    fill_in "Transaction", with: @splitsettlement.transaction_id
    click_on "Update Splitsettlement"

    assert_text "Splitsettlement was successfully updated"
    click_on "Back"
  end

  test "should destroy Splitsettlement" do
    visit splitsettlement_url(@splitsettlement)
    click_on "Destroy this splitsettlement", match: :first

    assert_text "Splitsettlement was successfully destroyed"
  end
end

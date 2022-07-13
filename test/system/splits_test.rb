require "application_system_test_case"

class SplitsTest < ApplicationSystemTestCase
  setup do
    @split = splits(:one)
  end

  test "visiting the index" do
    visit splits_url
    assert_selector "h1", text: "Splits"
  end

  test "should create split" do
    visit splits_url
    click_on "New split"

    fill_in "Account", with: @split.account
    fill_in "Product", with: @split.product_id
    fill_in "Split percent", with: @split.split_percent
    click_on "Create Split"

    assert_text "Split was successfully created"
    click_on "Back"
  end

  test "should update Split" do
    visit split_url(@split)
    click_on "Edit this split", match: :first

    fill_in "Account", with: @split.account
    fill_in "Product", with: @split.product_id
    fill_in "Split percent", with: @split.split_percent
    click_on "Update Split"

    assert_text "Split was successfully updated"
    click_on "Back"
  end

  test "should destroy Split" do
    visit split_url(@split)
    click_on "Destroy this split", match: :first

    assert_text "Split was successfully destroyed"
  end
end

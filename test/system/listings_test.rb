require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  setup do
    @listing = listings(:one)
  end

  test "visiting the index" do
    visit listings_url
    assert_selector "h1", text: "Listings"
  end

  test "should create listing" do
    visit listings_url
    click_on "New listing"

    fill_in "Address", with: @listing.address
    fill_in "Category", with: @listing.category_id
    fill_in "Description", with: @listing.description
    fill_in "Name", with: @listing.name
    fill_in "Phone", with: @listing.phone
    fill_in "Pin code", with: @listing.pin_code
    fill_in "Price", with: @listing.price
    click_on "Create Listing"

    assert_text "Listing was successfully created"
    click_on "Back"
  end

  test "should update Listing" do
    visit listing_url(@listing)
    click_on "Edit this listing", match: :first

    fill_in "Address", with: @listing.address
    fill_in "Category", with: @listing.category_id
    fill_in "Description", with: @listing.description
    fill_in "Name", with: @listing.name
    fill_in "Phone", with: @listing.phone
    fill_in "Pin code", with: @listing.pin_code
    fill_in "Price", with: @listing.price
    click_on "Update Listing"

    assert_text "Listing was successfully updated"
    click_on "Back"
  end

  test "should destroy Listing" do
    visit listing_url(@listing)
    click_on "Destroy this listing", match: :first

    assert_text "Listing was successfully destroyed"
  end
end

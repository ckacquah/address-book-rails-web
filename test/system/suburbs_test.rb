require "application_system_test_case"

class SuburbsTest < ApplicationSystemTestCase
  setup do
    @suburb = suburbs(:one)
  end

  test "visiting the index" do
    visit suburbs_url
    assert_selector "h1", text: "Suburbs"
  end

  test "should create suburb" do
    visit suburbs_url
    click_on "New suburb"

    check "Active status" if @suburb.active_status
    fill_in "Assigned code", with: @suburb.assigned_code
    fill_in "City town code", with: @suburb.city_town_code
    check "Del status" if @suburb.del_status
    fill_in "Description", with: @suburb.description
    fill_in "Name", with: @suburb.name
    click_on "Create Suburb"

    assert_text "Suburb was successfully created"
    click_on "Back"
  end

  test "should update Suburb" do
    visit suburb_url(@suburb)
    click_on "Edit this suburb", match: :first

    check "Active status" if @suburb.active_status
    fill_in "Assigned code", with: @suburb.assigned_code
    fill_in "City town code", with: @suburb.city_town_code
    check "Del status" if @suburb.del_status
    fill_in "Description", with: @suburb.description
    fill_in "Name", with: @suburb.name
    click_on "Update Suburb"

    assert_text "Suburb was successfully updated"
    click_on "Back"
  end

  test "should destroy Suburb" do
    visit suburb_url(@suburb)
    click_on "Destroy this suburb", match: :first

    assert_text "Suburb was successfully destroyed"
  end
end

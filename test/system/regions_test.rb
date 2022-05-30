require "application_system_test_case"

class RegionsTest < ApplicationSystemTestCase
  setup do
    @region = regions(:one)
  end

  test "visiting the index" do
    visit regions_url
    assert_selector "h1", text: "Regions"
  end

  test "should create region" do
    visit regions_url
    click_on "New region"

    check "Active status" if @region.active_status
    fill_in "Assigned code", with: @region.assigned_code
    check "Del status" if @region.del_status
    fill_in "Description", with: @region.description
    fill_in "Name", with: @region.name
    click_on "Create Region"

    assert_text "Region was successfully created"
    click_on "Back"
  end

  test "should update Region" do
    visit region_url(@region)
    click_on "Edit this region", match: :first

    check "Active status" if @region.active_status
    fill_in "Assigned code", with: @region.assigned_code
    check "Del status" if @region.del_status
    fill_in "Description", with: @region.description
    fill_in "Name", with: @region.name
    click_on "Update Region"

    assert_text "Region was successfully updated"
    click_on "Back"
  end

  test "should destroy Region" do
    visit region_url(@region)
    click_on "Destroy this region", match: :first

    assert_text "Region was successfully destroyed"
  end
end

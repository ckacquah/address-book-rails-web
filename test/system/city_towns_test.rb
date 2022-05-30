require "application_system_test_case"

class CityTownsTest < ApplicationSystemTestCase
  setup do
    @city_town = city_towns(:one)
  end

  test "visiting the index" do
    visit city_towns_url
    assert_selector "h1", text: "City towns"
  end

  test "should create city town" do
    visit city_towns_url
    click_on "New city town"

    check "Active status" if @city_town.active_status
    fill_in "Assigned code", with: @city_town.assigned_code
    check "Del status" if @city_town.del_status
    fill_in "Description", with: @city_town.description
    fill_in "Name", with: @city_town.name
    fill_in "Region code", with: @city_town.region_code
    click_on "Create City town"

    assert_text "City town was successfully created"
    click_on "Back"
  end

  test "should update City town" do
    visit city_town_url(@city_town)
    click_on "Edit this city town", match: :first

    check "Active status" if @city_town.active_status
    fill_in "Assigned code", with: @city_town.assigned_code
    check "Del status" if @city_town.del_status
    fill_in "Description", with: @city_town.description
    fill_in "Name", with: @city_town.name
    fill_in "Region code", with: @city_town.region_code
    click_on "Update City town"

    assert_text "City town was successfully updated"
    click_on "Back"
  end

  test "should destroy City town" do
    visit city_town_url(@city_town)
    click_on "Destroy this city town", match: :first

    assert_text "City town was successfully destroyed"
  end
end

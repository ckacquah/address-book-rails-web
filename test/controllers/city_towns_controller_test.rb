require "test_helper"

class CityTownsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_town = city_towns(:one)
  end

  test "should get index" do
    get city_towns_url
    assert_response :success
  end

  test "should get new" do
    get new_city_town_url
    assert_response :success
  end

  test "should create city_town" do
    assert_difference("CityTown.count") do
      post city_towns_url, params: { city_town: { active_status: @city_town.active_status, assigned_code: @city_town.assigned_code, del_status: @city_town.del_status, description: @city_town.description, name: @city_town.name, region_code: @city_town.region_code } }
    end

    assert_redirected_to city_town_url(CityTown.last)
  end

  test "should show city_town" do
    get city_town_url(@city_town)
    assert_response :success
  end

  test "should get edit" do
    get edit_city_town_url(@city_town)
    assert_response :success
  end

  test "should update city_town" do
    patch city_town_url(@city_town), params: { city_town: { active_status: @city_town.active_status, assigned_code: @city_town.assigned_code, del_status: @city_town.del_status, description: @city_town.description, name: @city_town.name, region_code: @city_town.region_code } }
    assert_redirected_to city_town_url(@city_town)
  end

  test "should destroy city_town" do
    assert_difference("CityTown.count", -1) do
      delete city_town_url(@city_town)
    end

    assert_redirected_to city_towns_url
  end
end

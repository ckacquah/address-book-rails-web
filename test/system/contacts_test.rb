require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:one)
  end

  test "visiting the index" do
    visit contacts_url
    assert_selector "h1", text: "Contacts"
  end

  test "should create contact" do
    visit contacts_url
    click_on "New contact"

    check "Active status" if @contact.active_status
    fill_in "Assigned code", with: @contact.assigned_code
    check "Del status" if @contact.del_status
    fill_in "Description", with: @contact.description
    fill_in "First name", with: @contact.first_name
    fill_in "Last name", with: @contact.last_name
    fill_in "Locality code", with: @contact.locality_code
    fill_in "Name", with: @contact.name
    fill_in "Phone", with: @contact.phone
    click_on "Create Contact"

    assert_text "Contact was successfully created"
    click_on "Back"
  end

  test "should update Contact" do
    visit contact_url(@contact)
    click_on "Edit this contact", match: :first

    check "Active status" if @contact.active_status
    fill_in "Assigned code", with: @contact.assigned_code
    check "Del status" if @contact.del_status
    fill_in "Description", with: @contact.description
    fill_in "First name", with: @contact.first_name
    fill_in "Last name", with: @contact.last_name
    fill_in "Locality code", with: @contact.locality_code
    fill_in "Name", with: @contact.name
    fill_in "Phone", with: @contact.phone
    click_on "Update Contact"

    assert_text "Contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact" do
    visit contact_url(@contact)
    click_on "Destroy this contact", match: :first

    assert_text "Contact was successfully destroyed"
  end
end

require "application_system_test_case"

class ProgramAreasTest < ApplicationSystemTestCase
  setup do
    @program_area = program_areas(:one)
  end

  test "visiting the index" do
    visit program_areas_url
    assert_selector "h1", text: "Program Areas"
  end

  test "creating a Program area" do
    visit program_areas_url
    click_on "New Program Area"

    fill_in "Description", with: @program_area.description
    fill_in "Name", with: @program_area.name
    click_on "Create Program area"

    assert_text "Program area was successfully created"
    click_on "Back"
  end

  test "updating a Program area" do
    visit program_areas_url
    click_on "Edit", match: :first

    fill_in "Description", with: @program_area.description
    fill_in "Name", with: @program_area.name
    click_on "Update Program area"

    assert_text "Program area was successfully updated"
    click_on "Back"
  end

  test "destroying a Program area" do
    visit program_areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Program area was successfully destroyed"
  end
end

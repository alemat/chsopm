require "application_system_test_case"

class FundingInstsTest < ApplicationSystemTestCase
  setup do
    @funding_inst = funding_insts(:one)
  end

  test "visiting the index" do
    visit funding_insts_url
    assert_selector "h1", text: "Funding Insts"
  end

  test "creating a Funding inst" do
    visit funding_insts_url
    click_on "New Funding Inst"

    fill_in "About", with: @funding_inst.about
    fill_in "Email", with: @funding_inst.email
    fill_in "Name", with: @funding_inst.name
    fill_in "Phone", with: @funding_inst.phone
    fill_in "Website", with: @funding_inst.website
    click_on "Create Funding inst"

    assert_text "Funding inst was successfully created"
    click_on "Back"
  end

  test "updating a Funding inst" do
    visit funding_insts_url
    click_on "Edit", match: :first

    fill_in "About", with: @funding_inst.about
    fill_in "Email", with: @funding_inst.email
    fill_in "Name", with: @funding_inst.name
    fill_in "Phone", with: @funding_inst.phone
    fill_in "Website", with: @funding_inst.website
    click_on "Update Funding inst"

    assert_text "Funding inst was successfully updated"
    click_on "Back"
  end

  test "destroying a Funding inst" do
    visit funding_insts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Funding inst was successfully destroyed"
  end
end

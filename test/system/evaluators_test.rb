require "application_system_test_case"

class EvaluatorsTest < ApplicationSystemTestCase
  setup do
    @evaluator = evaluators(:one)
  end

  test "visiting the index" do
    visit evaluators_url
    assert_selector "h1", text: "Evaluators"
  end

  test "creating a Evaluator" do
    visit evaluators_url
    click_on "New Evaluator"

    fill_in "Email", with: @evaluator.email
    fill_in "Evaluation", with: @evaluator.evaluation_id
    fill_in "Full Name", with: @evaluator.full_name
    fill_in "Phone", with: @evaluator.phone
    click_on "Create Evaluator"

    assert_text "Evaluator was successfully created"
    click_on "Back"
  end

  test "updating a Evaluator" do
    visit evaluators_url
    click_on "Edit", match: :first

    fill_in "Email", with: @evaluator.email
    fill_in "Evaluation", with: @evaluator.evaluation_id
    fill_in "Full Name", with: @evaluator.full_name
    fill_in "Phone", with: @evaluator.phone
    click_on "Update Evaluator"

    assert_text "Evaluator was successfully updated"
    click_on "Back"
  end

  test "destroying a Evaluator" do
    visit evaluators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evaluator was successfully destroyed"
  end
end

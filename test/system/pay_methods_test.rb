require "application_system_test_case"

class PayMethodsTest < ApplicationSystemTestCase
  setup do
    @pay_method = pay_methods(:one)
  end

  test "visiting the index" do
    visit pay_methods_url
    assert_selector "h1", text: "Pay Methods"
  end

  test "creating a Pay method" do
    visit pay_methods_url
    click_on "New Pay Method"

    fill_in "Code.integer", with: @pay_method.code.integer
    fill_in "Expires", with: @pay_method.expires
    fill_in "Name on", with: @pay_method.name_on
    fill_in "Number", with: @pay_method.number
    fill_in "Type", with: @pay_method.type
    click_on "Create Pay method"

    assert_text "Pay method was successfully created"
    click_on "Back"
  end

  test "updating a Pay method" do
    visit pay_methods_url
    click_on "Edit", match: :first

    fill_in "Code.integer", with: @pay_method.code.integer
    fill_in "Expires", with: @pay_method.expires
    fill_in "Name on", with: @pay_method.name_on
    fill_in "Number", with: @pay_method.number
    fill_in "Type", with: @pay_method.type
    click_on "Update Pay method"

    assert_text "Pay method was successfully updated"
    click_on "Back"
  end

  test "destroying a Pay method" do
    visit pay_methods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pay method was successfully destroyed"
  end
end

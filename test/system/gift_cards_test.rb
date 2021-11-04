require "application_system_test_case"

class GiftCardsTest < ApplicationSystemTestCase
  setup do
    @gift_card = gift_cards(:one)
  end

  test "visiting the index" do
    visit gift_cards_url
    assert_selector "h1", text: "Gift Cards"
  end

  test "creating a Gift card" do
    visit gift_cards_url
    click_on "New Gift Card"

    fill_in "Amount", with: @gift_card.amount
    fill_in "Notes", with: @gift_card.notes
    fill_in "Redeem code", with: @gift_card.redeem_code
    fill_in "Wallet", with: @gift_card.wallet_id
    click_on "Create Gift card"

    assert_text "Gift card was successfully created"
    click_on "Back"
  end

  test "updating a Gift card" do
    visit gift_cards_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @gift_card.amount
    fill_in "Notes", with: @gift_card.notes
    fill_in "Redeem code", with: @gift_card.redeem_code
    fill_in "Wallet", with: @gift_card.wallet_id
    click_on "Update Gift card"

    assert_text "Gift card was successfully updated"
    click_on "Back"
  end

  test "destroying a Gift card" do
    visit gift_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gift card was successfully destroyed"
  end
end

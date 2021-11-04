require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    fill_in "Brand", with: @item.brand
    fill_in "Category", with: @item.category_id
    fill_in "Color", with: @item.color
    fill_in "Countryoforigin", with: @item.countryOfOrigin
    fill_in "Description", with: @item.description
    fill_in "Dimensions", with: @item.dimensions
    fill_in "Inventory", with: @item.inventory_id
    fill_in "Manufacturer", with: @item.manufacturer
    fill_in "Material", with: @item.material
    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price
    fill_in "Quantity", with: @item.quantity
    fill_in "Rating", with: @item.rating
    fill_in "Sku", with: @item.sku
    fill_in "Weight", with: @item.weight
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @item.brand
    fill_in "Category", with: @item.category_id
    fill_in "Color", with: @item.color
    fill_in "Countryoforigin", with: @item.countryOfOrigin
    fill_in "Description", with: @item.description
    fill_in "Dimensions", with: @item.dimensions
    fill_in "Inventory", with: @item.inventory_id
    fill_in "Manufacturer", with: @item.manufacturer
    fill_in "Material", with: @item.material
    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price
    fill_in "Quantity", with: @item.quantity
    fill_in "Rating", with: @item.rating
    fill_in "Sku", with: @item.sku
    fill_in "Weight", with: @item.weight
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end

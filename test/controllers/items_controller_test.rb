require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { brand: @item.brand, category_id: @item.category_id, colo: @item.colo, description: @item.description, dimensions: @item.dimensions, inventory_id: @item.inventory_id, manufacturer: @item.manufacturer, material: @item.material, name: @item.name, order_id: @item.order_id, origin: @item.origin, price: @item.price, quantity: @item.quantity, rating: @item.rating, shopping_cart_id: @item.shopping_cart_id, sku: @item.sku, weight: @item.weight } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { brand: @item.brand, category_id: @item.category_id, colo: @item.colo, description: @item.description, dimensions: @item.dimensions, inventory_id: @item.inventory_id, manufacturer: @item.manufacturer, material: @item.material, name: @item.name, order_id: @item.order_id, origin: @item.origin, price: @item.price, quantity: @item.quantity, rating: @item.rating, shopping_cart_id: @item.shopping_cart_id, sku: @item.sku, weight: @item.weight } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end

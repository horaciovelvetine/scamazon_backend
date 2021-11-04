require "test_helper"

class PayMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pay_method = pay_methods(:one)
  end

  test "should get index" do
    get pay_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_pay_method_url
    assert_response :success
  end

  test "should create pay_method" do
    assert_difference('PayMethod.count') do
      post pay_methods_url, params: { pay_method: { code.integer: @pay_method.code.integer, expires: @pay_method.expires, name_on: @pay_method.name_on, number: @pay_method.number, type: @pay_method.type } }
    end

    assert_redirected_to pay_method_url(PayMethod.last)
  end

  test "should show pay_method" do
    get pay_method_url(@pay_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_pay_method_url(@pay_method)
    assert_response :success
  end

  test "should update pay_method" do
    patch pay_method_url(@pay_method), params: { pay_method: { code.integer: @pay_method.code.integer, expires: @pay_method.expires, name_on: @pay_method.name_on, number: @pay_method.number, type: @pay_method.type } }
    assert_redirected_to pay_method_url(@pay_method)
  end

  test "should destroy pay_method" do
    assert_difference('PayMethod.count', -1) do
      delete pay_method_url(@pay_method)
    end

    assert_redirected_to pay_methods_url
  end
end

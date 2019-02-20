require 'test_helper'

class ApiCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
    @customer_1 = customers(:one)
    @customer_2 = customers(:two)
  end

  test "should get index with valid secret key" do
    get api_customers_url(secret: 'secret')
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal body.count, 2
  end

  test "should not get index and return 401 without secret key" do
    get api_customers_url(secret: nil)
    assert_response :unauthorized
  end

  test "should not get index and return 401 with invalid secret key" do
    get api_customers_url(secret: 'invalid')
    assert_response :unauthorized
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post api_customers_url, params: { name: "Name", address_id: @address.id, secret: 'secret' }
    end

    assert_response :success
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete api_customer_url(@customer_1, secret: 'secret')
    end

    assert_response :success
  end
end

require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: valid_customer_params()
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: valid_customer_params()
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should save a tracker when updating customer with note" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @customer, customer: customer_params_with_note
    end
  end

  test "should save a tracker when updating customer with attachment" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @customer, customer: customer_params_with_attachment
    end
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end

  test '#create_call should assign a call and create tracker' do
    call = calls(:one)
    assert_difference 'Tracker.count', 1 do
      get :create_call, id: @customer.id, call: {call_id: call.id}
    end
    assert_includes @customer.calls, call
  end

  def valid_customer_params
    {first_name: 'First', last_name:'Last', email: 'test@example.com'}
  end

  def customer_params_with_note
    {first_name: 'First', last_name:'Last', email: 'test@example.com', notes_attributes:[{content: 'note'}]}
  end

  def customer_params_with_attachment
    {first_name: 'First', last_name:'Last', email: 'test@example.com', uploads_attributes:[{description: 'desc'}]}
  end
end

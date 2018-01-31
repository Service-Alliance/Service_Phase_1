require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('vehicle.count') do
      post :create, vehicle: { year: @vehicle.year, state: @vehicle.state, name: @vehicle.name, brand: @vehicle.brand, license_plate: @vehicle.license_plate, mileage: @vehicle.mileage,
      registration_date: @vehicle.registration_date, insurance_date: @vehicle.insurance_date, inspection_date: @vehicle.inspection_date, oil_change: @vehicle.oil_change, 
      brakes: @vehicle.brakes, battery: @vehicle.battery, filters: @vehicle.filters, tires: @vehicle.tires, transmission: @vehicle.transmission fluids: @vehcile.fluids, miscellaneous: @vehicle.miscellaneous}
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    patch :update, id: @vehicle, vehicle: { year: @vehicle.year, state: @vehicle.state, name: @vehicle.name, brand: @vehicle.brand, license_plate: @vehicle.license_plate, mileage: @vehicle.mileage,
      registration_date: @vehicle.registration_date, insurance_date: @vehicle.insurance_date, inspection_date: @vehicle.inspection_date, oil_change: @vehicle.oil_change, 
      brakes: @vehicle.brakes, battery: @vehicle.battery, filters: @vehicle.filters, tires: @vehicle.tires, transmission: @vehicle.transmission, fluids: @vehcile.fluids, miscellaneous: @vehicle.miscellaneous}
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end

# require 'test_helper'

# class ChemicalsControllerTest < ActionController::TestCase
#   setup do
#     @chemical = chemicals(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:chemicals)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create chemical" do
#     assert_difference('Chemical.count') do
#       post :create, chemical: { cost_per_purchase_unit: @chemical.cost_per_purchase_unit, name: @chemical.name, purchase_unit: @chemical.purchase_unit, purchase_unit_quantity: @chemical.purchase_unit_quantity, quantity: @chemical.quantity, sp_number: @chemical.sp_number }
#     end

#     assert_redirected_to chemical_path(assigns(:chemical))
#   end

#   test "should show chemical" do
#     get :show, id: @chemical
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @chemical
#     assert_response :success
#   end

#   test "should update chemical" do
#     patch :update, id: @chemical, chemical: { cost_per_purchase_unit: @chemical.cost_per_purchase_unit, name: @chemical.name, purchase_unit: @chemical.purchase_unit, purchase_unit_quantity: @chemical.purchase_unit_quantity, quantity: @chemical.quantity, sp_number: @chemical.sp_number }
#     assert_redirected_to chemical_path(assigns(:chemical))
#   end

#   test "should destroy chemical" do
#     assert_difference('Chemical.count', -1) do
#       delete :destroy, id: @chemical
#     end

#     assert_redirected_to chemicals_path
#   end
# end

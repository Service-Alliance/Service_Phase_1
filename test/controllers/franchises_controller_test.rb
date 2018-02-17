require 'test_helper'

class FranchisesControllerTest < ActionController::TestCase
  setup do
    @franchise = franchises(:one)
    @attributes = {
      name: @franchise.name,
      franchise_number: @franchise.franchise_number,
      legal_name: @franchise.legal_name
    }
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:franchises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create franchise" do
    assert_difference('Franchise.count') do
      post :create, franchise: @attributes
    end

    assert_redirected_to franchise_path(assigns(:franchise))
  end

  test "should show franchise" do
    get :show, id: @franchise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @franchise
    assert_response :success
  end

  test "should update franchise" do
    patch :update, id: @franchise, franchise: @attributes
    assert_redirected_to franchise_path(assigns(:franchise))
  end

  test "should save a tracker when updating franchise with note" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @franchise, franchise: franchise_params_with_note(@attributes)
    end
    Tracker.last.tap do |t|
      assert_equal t.tracker_task.name, 'Note Created'
      assert_equal t.trackable, @franchise
    end
  end

  test "should save a tracker when updating franchise with attachment" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @franchise, franchise: franchise_params_with_attachment(@attributes)
    end
    Tracker.last.tap do |t|
      assert_equal t.tracker_task.name, 'File Uploaded'
      assert_equal t.trackable, @franchise
    end
  end

  test "should destroy franchise" do
    assert_difference('Franchise.count', -1) do
      delete :destroy, id: @franchise
    end

    assert_redirected_to franchises_path
  end

  def franchise_params_with_note(attribs)
    attribs.merge(notes_attributes: [{content: 'note'}])
  end

  def franchise_params_with_attachment(attribs)
    attribs.merge(uploads_attributes: [{description: 'desc', upload_category_id: upload_categories(:one).id}])
  end
end

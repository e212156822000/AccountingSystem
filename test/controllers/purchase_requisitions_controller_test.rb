require 'test_helper'

class PurchaseRequisitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_requisition = purchase_requisitions(:one)
  end

  test "should get index" do
    get purchase_requisitions_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_requisition_url
    assert_response :success
  end

  test "should create purchase_requisition" do
    assert_difference('PurchaseRequisition.count') do
      post purchase_requisitions_url, params: { purchase_requisition: {  } }
    end

    assert_redirected_to purchase_requisition_url(PurchaseRequisition.last)
  end

  test "should show purchase_requisition" do
    get purchase_requisition_url(@purchase_requisition)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_requisition_url(@purchase_requisition)
    assert_response :success
  end

  test "should update purchase_requisition" do
    patch purchase_requisition_url(@purchase_requisition), params: { purchase_requisition: {  } }
    assert_redirected_to purchase_requisition_url(@purchase_requisition)
  end

  test "should destroy purchase_requisition" do
    assert_difference('PurchaseRequisition.count', -1) do
      delete purchase_requisition_url(@purchase_requisition)
    end

    assert_redirected_to purchase_requisitions_url
  end
end

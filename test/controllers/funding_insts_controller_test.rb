require 'test_helper'

class FundingInstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funding_inst = funding_insts(:one)
  end

  test "should get index" do
    get funding_insts_url
    assert_response :success
  end

  test "should get new" do
    get new_funding_inst_url
    assert_response :success
  end

  test "should create funding_inst" do
    assert_difference('FundingInst.count') do
      post funding_insts_url, params: { funding_inst: { about: @funding_inst.about, email: @funding_inst.email, name: @funding_inst.name, phone: @funding_inst.phone, website: @funding_inst.website } }
    end

    assert_redirected_to funding_inst_url(FundingInst.last)
  end

  test "should show funding_inst" do
    get funding_inst_url(@funding_inst)
    assert_response :success
  end

  test "should get edit" do
    get edit_funding_inst_url(@funding_inst)
    assert_response :success
  end

  test "should update funding_inst" do
    patch funding_inst_url(@funding_inst), params: { funding_inst: { about: @funding_inst.about, email: @funding_inst.email, name: @funding_inst.name, phone: @funding_inst.phone, website: @funding_inst.website } }
    assert_redirected_to funding_inst_url(@funding_inst)
  end

  test "should destroy funding_inst" do
    assert_difference('FundingInst.count', -1) do
      delete funding_inst_url(@funding_inst)
    end

    assert_redirected_to funding_insts_url
  end
end

require 'test_helper'

class InstitutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @institution = institutions(:one)
  end

  test "should get index" do
    get institutions_url
    assert_response :success
  end

  test "should get new" do
    get new_institution_url
    assert_response :success
  end

  test "should create institution" do
    assert_difference('Institution.count') do
      post institutions_url, params: { institution: { about_institution: @institution.about_institution, contact_email: @institution.contact_email, contact_person: @institution.contact_person, contact_phone: @institution.contact_phone, district: @institution.district, fax_number: @institution.fax_number, institution_status_id: @institution.institution_status_id, institution_type_id: @institution.institution_type_id, license_no: @institution.license_no, name: @institution.name, office_email: @institution.office_email, office_phone: @institution.office_phone, p_o_box: @institution.p_o_box, region_id: @institution.region_id, short_name: @institution.short_name, url: @institution.url } }
    end

    assert_redirected_to institution_url(Institution.last)
  end

  test "should show institution" do
    get institution_url(@institution)
    assert_response :success
  end

  test "should get edit" do
    get edit_institution_url(@institution)
    assert_response :success
  end

  test "should update institution" do
    patch institution_url(@institution), params: { institution: { about_institution: @institution.about_institution, contact_email: @institution.contact_email, contact_person: @institution.contact_person, contact_phone: @institution.contact_phone, district: @institution.district, fax_number: @institution.fax_number, institution_status_id: @institution.institution_status_id, institution_type_id: @institution.institution_type_id, license_no: @institution.license_no, name: @institution.name, office_email: @institution.office_email, office_phone: @institution.office_phone, p_o_box: @institution.p_o_box, region_id: @institution.region_id, short_name: @institution.short_name, url: @institution.url } }
    assert_redirected_to institution_url(@institution)
  end

  test "should destroy institution" do
    assert_difference('Institution.count', -1) do
      delete institution_url(@institution)
    end

    assert_redirected_to institutions_url
  end
end

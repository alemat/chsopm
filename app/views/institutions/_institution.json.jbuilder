json.extract! institution, :id, :name, :short_name, :institution_type_id, :institution_status_id, :license_no, :url, :about_institution, :region_id, :district, :office_phone, :office_email, :p_o_box, :fax_number, :contact_person, :contact_phone, :contact_email, :created_at, :updated_at
json.url institution_url(institution, format: :json)

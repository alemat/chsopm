# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180603061403) do

  create_table "evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.bigint "project_evaluation_type_id"
    t.string "evaluator_full_name"
    t.text "remark"
    t.string "evaluation_file_file_name"
    t.string "evaluation_file_content_type"
    t.integer "evaluation_file_file_size"
    t.datetime "evaluation_file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_evaluation_type_id"], name: "index_evaluations_on_project_evaluation_type_id"
    t.index ["project_id"], name: "index_evaluations_on_project_id"
  end

  create_table "focus_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.bigint "institution_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_funders_on_institution_id"
    t.index ["project_id"], name: "index_funders_on_project_id"
  end

  create_table "funding_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "implementation_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.bigint "region_id"
    t.string "zone"
    t.string "district"
    t.string "contact_person"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_implementation_areas_on_project_id"
    t.index ["region_id"], name: "index_implementation_areas_on_region_id"
  end

  create_table "institution_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institution_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "short_name"
    t.bigint "institution_type_id"
    t.bigint "institution_status_id"
    t.integer "license_no"
    t.string "url"
    t.text "about_institution"
    t.bigint "region_id"
    t.string "district"
    t.string "office_phone"
    t.string "office_email"
    t.string "p_o_box"
    t.string "fax_number"
    t.string "contact_person"
    t.string "contact_phone"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_status_id"], name: "index_institutions_on_institution_status_id"
    t.index ["institution_type_id"], name: "index_institutions_on_institution_type_id"
    t.index ["region_id"], name: "index_institutions_on_region_id"
  end

  create_table "performance_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.bigint "reporting_type_id"
    t.text "remark"
    t.string "performance_report_file_file_name"
    t.string "performance_report_file_content_type"
    t.integer "performance_report_file_file_size"
    t.datetime "performance_report_file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_performance_reports_on_project_id"
    t.index ["reporting_type_id"], name: "index_performance_reports_on_reporting_type_id"
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_amendments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.date "from"
    t.date "to"
    t.text "amendment_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_amendments_on_project_id"
  end

  create_table "project_evaluation_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "project_title"
    t.bigint "institution_id"
    t.bigint "focus_area_id"
    t.bigint "sub_focus_area_id"
    t.text "project_details"
    t.bigint "project_status_id"
    t.integer "direct_beneficiaries"
    t.integer "indirect_beneficiaries"
    t.date "start_date"
    t.date "end_date"
    t.float "total_budget", limit: 24
    t.float "program_budget", limit: 24
    t.float "admin_budget", limit: 24
    t.bigint "funding_status_id"
    t.date "mid_term_evaluation_date"
    t.date "end_term_evaluation_date"
    t.bigint "reporting_type_id"
    t.string "project_focal_person"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["focus_area_id"], name: "index_projects_on_focus_area_id"
    t.index ["funding_status_id"], name: "index_projects_on_funding_status_id"
    t.index ["institution_id"], name: "index_projects_on_institution_id"
    t.index ["project_status_id"], name: "index_projects_on_project_status_id"
    t.index ["reporting_type_id"], name: "index_projects_on_reporting_type_id"
    t.index ["sub_focus_area_id"], name: "index_projects_on_sub_focus_area_id"
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_focus_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "focus_area_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["focus_area_id"], name: "index_sub_focus_areas_on_focus_area_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "evaluations", "project_evaluation_types"
  add_foreign_key "evaluations", "projects"
  add_foreign_key "funders", "institutions"
  add_foreign_key "funders", "projects"
  add_foreign_key "implementation_areas", "projects"
  add_foreign_key "implementation_areas", "regions"
  add_foreign_key "institutions", "institution_statuses"
  add_foreign_key "institutions", "institution_types"
  add_foreign_key "institutions", "regions"
  add_foreign_key "performance_reports", "projects"
  add_foreign_key "performance_reports", "reporting_types"
  add_foreign_key "project_amendments", "projects"
  add_foreign_key "projects", "focus_areas"
  add_foreign_key "projects", "funding_statuses"
  add_foreign_key "projects", "institutions"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "projects", "reporting_types"
  add_foreign_key "projects", "sub_focus_areas"
  add_foreign_key "sub_focus_areas", "focus_areas"
end

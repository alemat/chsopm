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

ActiveRecord::Schema.define(version: 2019_12_04_131511) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.string "project_evaluation_type"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "evaluation_date"
    t.index ["project_id"], name: "index_evaluations_on_project_id"
  end

  create_table "evaluators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.string "full_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluators_on_evaluation_id"
  end

  create_table "focus_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "institution_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "currency"
    t.bigint "funding_inst_id"
    t.index ["funding_inst_id"], name: "index_funders_on_funding_inst_id"
    t.index ["institution_id"], name: "index_funders_on_institution_id"
    t.index ["project_id"], name: "index_funders_on_project_id"
  end

  create_table "funding_insts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "website"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funding_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "helps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "help"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "implementation_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "region_id"
    t.string "zone"
    t.string "district"
    t.string "contact_person"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "allocated_budget"
    t.index ["project_id"], name: "index_implementation_areas_on_project_id"
    t.index ["region_id"], name: "index_implementation_areas_on_region_id"
  end

  create_table "institution_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institution_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "performance_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "reporting_type_id"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "report_date"
    t.index ["project_id"], name: "index_performance_reports_on_project_id"
    t.index ["reporting_type_id"], name: "index_performance_reports_on_reporting_type_id"
  end

  create_table "program_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
  end

  create_table "project_amendments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.date "from"
    t.date "to"
    t.text "amendment_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approval_status"
    t.index ["project_id"], name: "index_project_amendments_on_project_id"
  end

  create_table "project_extentions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.string "subject"
    t.boolean "activity_change"
    t.boolean "budget_change"
    t.boolean "ia_change"
    t.boolean "within_project_duration"
    t.boolean "approval_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "details"
    t.index ["project_id"], name: "index_project_extentions_on_project_id"
  end

  create_table "project_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "project_title"
    t.bigint "institution_id"
    t.bigint "focus_area_id"
    t.bigint "sub_focus_area_id"
    t.text "project_details"
    t.string "project_status"
    t.integer "direct_beneficiaries"
    t.integer "indirect_beneficiaries"
    t.date "start_date"
    t.date "end_date"
    t.float "total_budget"
    t.float "program_budget"
    t.float "admin_budget"
    t.bigint "funding_status_id"
    t.bigint "reporting_type_id"
    t.string "project_focal_person"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "report_status"
    t.string "currency"
    t.bigint "user_id"
    t.boolean "acceptance_status"
    t.bigint "program_area_id"
    t.string "ibt"
    t.string "dbt"
    t.text "other_sub_focus_areas"
    t.index ["focus_area_id"], name: "index_projects_on_focus_area_id"
    t.index ["funding_status_id"], name: "index_projects_on_funding_status_id"
    t.index ["institution_id"], name: "index_projects_on_institution_id"
    t.index ["program_area_id"], name: "index_projects_on_program_area_id"
    t.index ["reporting_type_id"], name: "index_projects_on_reporting_type_id"
    t.index ["sub_focus_area_id"], name: "index_projects_on_sub_focus_area_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "regions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_focus_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "focus_area_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["focus_area_id"], name: "index_sub_focus_areas_on_focus_area_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.boolean "admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "institution_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["institution_id"], name: "index_users_on_institution_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "evaluations", "projects"
  add_foreign_key "evaluators", "evaluations"
  add_foreign_key "funders", "funding_insts"
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
  add_foreign_key "project_extentions", "projects"
  add_foreign_key "projects", "focus_areas"
  add_foreign_key "projects", "funding_statuses"
  add_foreign_key "projects", "institutions"
  add_foreign_key "projects", "program_areas"
  add_foreign_key "projects", "reporting_types"
  add_foreign_key "projects", "sub_focus_areas"
  add_foreign_key "projects", "users"
  add_foreign_key "sub_focus_areas", "focus_areas"
  add_foreign_key "users", "institutions"
end

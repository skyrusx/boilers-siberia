# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_12_163541) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"

  create_table "accounts", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "email"
    t.string "phone"
    t.string "password_digest", default: "", null: false
    t.integer "platform", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "account_type", default: 50
    t.boolean "is_subscribed", default: false
    t.integer "status", default: 0
    t.datetime "phone_confirmed_at", precision: nil
    t.datetime "phone_confirmation_sent_at", precision: nil
    t.string "phone_confirmation_token"
  end

  create_table "admin_files", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data", null: false
    t.string "entity_type"
    t.bigint "entity_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "admin_monitoring_reports", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.string "monitoring_type", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "region_id"
    t.bigint "user_id"
  end

  create_table "admin_users", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "region_id"
    t.integer "role", null: false
    t.bigint "yard_municipal_formation_id"
    t.bigint "history_municipal_formation_id"
    t.boolean "access_to_surveys", default: false
    t.boolean "is_active", default: true, null: false
  end

  create_table "advantages", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blazer_audits", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at", precision: nil
  end

  create_table "blazer_checks", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "blazer_dashboard_queries", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "blazer_dashboards", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "creator_id"
    t.text "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "blazer_queries", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "building_object_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "building_object_monitoring_id"
    t.text "file_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "photo_date", null: false
  end

  create_table "building_object_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "comment"
    t.string "verifier", null: false
    t.string "stage", null: false
    t.date "verified_date", null: false
    t.bigint "building_object_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "timeline", null: false
    t.string "rubricator", default: "000000", null: false
  end

  create_table "building_objects", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title", null: false
    t.string "code"
    t.bigint "region_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "monitorings_count", default: 0
    t.string "finish_date"
    t.text "address"
    t.string "subsidy"
    t.boolean "is_deleted", default: false, null: false
    t.boolean "is_new", default: false, null: false
    t.string "color", default: "grey", null: false
    t.string "old_title"
    t.date "contract_check_date"
    t.string "contract_comment"
  end

  create_table "cities", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.bigint "region_id"
    t.boolean "major", default: false
    t.string "area"
    t.string "kladr_code", limit: 13
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
  end

  create_table "cities-tmp", id: false, force: :cascade do |t|
    t.integer "id"
    t.text "title"
    t.text "area"
    t.text "region"
    t.integer "important"
    t.integer "region_id"
  end

  create_table "ckeditor_assets", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "data_data", null: false
    t.string "type", limit: 30
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "click_urls", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "news_id"
    t.string "path"
    t.string "url"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "clicks", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "click_url_id"
    t.inet "ip"
    t.string "user_agent"
    t.uuid "profile_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "culture_object_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "culture_object_monitoring_id"
    t.text "file_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "culture_object_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date", null: false
    t.string "verifier", null: false
    t.string "work_type", null: false
    t.string "stage", null: false
    t.text "comment"
    t.string "timeline", null: false
    t.bigint "culture_object_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "rubricator", default: "000000", null: false
  end

  create_table "culture_objects", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title", null: false
    t.string "code"
    t.text "agreement"
    t.string "object_type", null: false
    t.date "finish_date"
    t.text "address"
    t.text "subsidy"
    t.integer "monitorings_count", default: 0
    t.bigint "region_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "financing_source"
    t.string "color", default: "grey", null: false
    t.string "old_title"
    t.date "contract_check_date"
    t.string "contract_comment"
  end

  create_table "curators", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "name"
    t.string "post"
    t.text "image_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "bio"
  end

  create_table "curators_platforms", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "curator_id"
    t.bigint "platform_id"
    t.integer "curator_status", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "devices", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "account_id"
    t.string "fcm_token"
    t.integer "platform", default: 0
    t.string "device_uid"
    t.string "client_version"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "email_events", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "account_id"
    t.string "email"
    t.integer "status"
    t.datetime "event_time", precision: nil
    t.jsonb "delivery_info"
  end

  create_table "email_opt_outs", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "account_id"
    t.bigint "email_id"
    t.integer "list"
    t.boolean "active", default: true
    t.text "reason"
  end

  create_table "emails", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "heading"
    t.text "content"
    t.integer "list", default: 0
    t.json "options", default: "{}"
    t.bigint "platform_id"
    t.text "user_ids"
    t.datetime "delivery_time", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "emails_platforms", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "platform_id"
    t.bigint "email_id"
  end

  create_table "emails_target_audiences", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "target_audience_id"
    t.bigint "email_id"
  end

  create_table "federal_districts", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
  end

  create_table "history_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data", null: false
    t.string "timeline", null: false
    t.date "photo_date", null: false
    t.text "comment"
    t.bigint "history_municipal_formation_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "history_municipal_formations", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title", null: false
    t.string "nomination"
    t.string "project_title"
    t.bigint "region_id"
    t.integer "total_budget"
    t.integer "federal_budget"
    t.integer "regional_budget"
    t.integer "municipal_budget"
    t.integer "private_budget"
    t.integer "square"
    t.integer "private_square"
    t.text "address"
    t.text "work_amount"
    t.string "purchase", default: "empty_purchase", null: false
    t.text "purchase_comment"
    t.string "purchase_url"
    t.date "finish_date"
    t.boolean "expertise", default: false, null: false
    t.boolean "difference", default: false, null: false
    t.text "comment_difference"
    t.text "file_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "medical2021_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data"
    t.date "photo_date"
    t.bigint "medical2021_monitoring_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "medical2021_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date", null: false
    t.bigint "medical2021_point_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "medical2021_points", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "region_id"
    t.string "city"
    t.string "polyclinic"
    t.string "address"
    t.string "distance"
    t.string "pedestrian_crossing"
    t.string "equipped_entrance"
    t.string "gender_respondent"
    t.string "respondent_age"
    t.string "limitation"
    t.string "type_movement"
    t.string "travel_time_onfoot"
    t.string "comfort"
    t.string "reason"
    t.string "comment_onfoot"
    t.string "type_transport"
    t.string "travel_time_public_transport"
    t.string "difficulty"
    t.string "difficulty_item"
    t.string "other_comment"
    t.string "traffic_jam"
    t.string "other_1_comment"
    t.string "travel_time_car"
    t.string "parking"
    t.string "parking_problem"
    t.string "other_comment_parking"
    t.string "other_polyclinic"
    t.string "other_polyclinic_comment"
    t.string "necessity"
    t.string "necessity_comment"
    t.string "type_movement_other"
    t.string "travel_time_onfoot_other"
    t.string "reason_other"
    t.string "comment_onfoot_other"
    t.string "travel_time_transport_other"
    t.string "difficulties_other"
    t.string "difficulties_items_other"
    t.string "difficulties_items_other_comment"
    t.string "travel_time_car_other"
    t.string "comment"
    t.string "contacts"
    t.string "comment_people"
    t.integer "monitorings_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "monitoring_result_docs", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "monitoring_result_id"
    t.text "file_data", null: false
    t.string "monitoring_type", null: false
    t.string "timeline", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "monitoring_result_infos", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "monitoring_results", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "region_id"
    t.bigint "monitoring_result_info_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "news", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.text "text"
    t.text "image_data"
    t.datetime "published_at", precision: nil
    t.datetime "push_sent_at", precision: nil
    t.string "jid"
    t.bigint "platform_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.tsvector "tsv"
    t.boolean "parsed", default: false
  end

  create_table "news_statistics", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.integer "news_id"
    t.integer "account_id"
    t.string "user_agent"
    t.string "event"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "news_target_audiences", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "target_audience_id"
    t.bigint "news_id"
  end

  create_table "oauth_access_grants", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.integer "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "revoked_at", precision: nil
    t.string "scopes"
  end

  create_table "oauth_access_tokens", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.integer "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
  end

  create_table "oauth_applications", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "organizations", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.bigint "city_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "paramedic2020_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data"
    t.date "photo_date"
    t.bigint "paramedic2020_monitoring_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "paramedic2020_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date", null: false
    t.string "verifier"
    t.string "stage", null: false
    t.text "comment"
    t.string "timeline", null: false
    t.bigint "paramedic2020_point_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "fap_open_state"
    t.string "medic_on_site"
    t.string "operating_mode_info_present"
    t.text "operating_mode"
    t.string "territory_landscaped"
  end

  create_table "paramedic2020_points", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "address", null: false
    t.string "point_type"
    t.string "subsidy"
    t.date "contract_date"
    t.date "finish_date"
    t.integer "population"
    t.string "responsible"
    t.string "coordinator"
    t.string "has_med_org"
    t.string "activist_full_name"
    t.string "activist_profession"
    t.string "activist_phone"
    t.string "activist_email"
    t.string "activist_path_time"
    t.integer "monitorings_count", default: 0, null: false
    t.bigint "region_id"
    t.string "purchase_stage"
    t.string "string"
    t.string "financing_source"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "license_availability"
    t.date "purchase_actual_date"
    t.integer "work_days"
    t.decimal "nmck_mo_price"
    t.decimal "contract_price"
    t.string "equipment_availability"
    t.decimal "room_area"
    t.string "purchase_type"
    t.string "method_determine_supplier"
    t.string "customer"
    t.string "supplier"
    t.text "purchase_comments"
    t.text "purchase_link"
    t.date "building_end_date"
    t.text "activist_residence"
    t.string "contract_address"
    t.string "purchase_contract_no"
    t.text "license_data"
    t.string "ext_info"
    t.string "monitoring_stage4_enabled", default: "no"
    t.string "monitoring_stage5_enabled", default: "no"
    t.string "monitoring_stage6_enabled", default: "no"
  end

  create_table "paramedic_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data"
    t.date "photo_date"
    t.bigint "paramedic_monitoring_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "paramedic_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date", null: false
    t.string "verifier"
    t.string "stage"
    t.text "comment"
    t.string "timeline", null: false
    t.bigint "paramedic_point_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "rubricator", default: "000000", null: false
    t.string "info_about_work"
  end

  create_table "paramedic_points", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "address", null: false
    t.string "point_type"
    t.string "subsidy"
    t.string "contract_date"
    t.date "finish_date"
    t.integer "population"
    t.string "responsible"
    t.string "coordinator"
    t.boolean "has_med_org"
    t.string "activist_full_name"
    t.string "activist_representation"
    t.string "activist_profession"
    t.text "activist_competition"
    t.string "activist_phone"
    t.string "activist_email"
    t.string "activist_vk_url"
    t.integer "activist_path_time"
    t.integer "monitorings_count", default: 0, null: false
    t.bigint "region_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "purchase_stage"
    t.string "financing_source"
  end

  create_table "platform_subscriptions", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "account_id"
    t.bigint "platform_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "platforms", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.text "description"
    t.text "short_description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "goals"
    t.boolean "followable", default: false
  end

  create_table "profiles", id: false, force: :cascade do |t|
    t.uuid "id", default: -> { "public.gen_random_uuid()" }, null: false
    t.bigint "account_id"
    t.string "name"
    t.text "image_data"
    t.integer "gender", default: 0, null: false
    t.integer "year_of_birth"
    t.bigint "city_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "psycho_school_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "psycho_school_monitoring_id"
    t.text "file_data"
    t.date "photo_date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "psycho_school_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date"
    t.string "verifier"
    t.string "stage"
    t.text "comment"
    t.string "timeline", null: false
    t.bigint "psycho_school_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "rubricator", default: "000000", null: false
  end

  create_table "psycho_schools", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "title", null: false
    t.string "code"
    t.text "agreement"
    t.string "finish_date"
    t.text "address"
    t.integer "monitorings_count", default: 0
    t.bigint "region_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "color", default: "grey", null: false
  end

  create_table "pushes", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.integer "push_type", default: 0
    t.text "recipients"
    t.integer "account_type"
    t.string "title"
    t.text "text"
    t.integer "ttl"
    t.string "action_type"
    t.json "action_data"
    t.integer "platform"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "pushes_target_audiences", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "target_audience_id"
    t.bigint "push_id"
  end

  create_table "regions", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.bigint "federal_district_id"
    t.integer "code", null: false
    t.integer "average_salary"
  end

  create_table "results", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "platform_id"
    t.string "title"
    t.text "file_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "url"
  end

  create_table "school_object_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "school_object_monitoring_id"
    t.text "file_data"
    t.date "photo_date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "school_object_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date"
    t.string "verifier"
    t.string "stage"
    t.text "comment"
    t.string "timeline", null: false
    t.bigint "school_object_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "rubricator", default: "000000", null: false
  end

  create_table "school_objects", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title", null: false
    t.string "code"
    t.text "agreement"
    t.text "finish_date"
    t.text "address"
    t.integer "monitorings_count", default: 0
    t.bigint "region_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "color", default: "grey", null: false
    t.string "old_title"
    t.date "contract_check_date"
    t.string "contract_comment"
  end

  create_table "social2020_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data"
    t.date "photo_date"
    t.bigint "social2020_monitoring_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social2020_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date", null: false
    t.string "verifier"
    t.string "stage", null: false
    t.string "fact_plan_deadline"
    t.text "comment"
    t.string "timeline", null: false
    t.bigint "social2020_point_id"
    t.string "rubricator", default: "000000", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social2020_points", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "address", null: false
    t.string "national_project"
    t.string "federal_project"
    t.string "agreement_number"
    t.string "capital_construction_object_name"
    t.string "point_type"
    t.string "construction_time"
    t.float "maximum_cost"
    t.integer "monitorings_count", default: 0, null: false
    t.bigint "region_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social2021_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data"
    t.date "photo_date"
    t.bigint "social2021_monitoring_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social2021_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date", null: false
    t.string "verifier"
    t.text "purchase_ref"
    t.string "work_stage"
    t.date "finish_date"
    t.string "stage", null: false
    t.string "fact_plan_deadline"
    t.text "comment"
    t.string "timeline", null: false
    t.bigint "social2021_point_id"
    t.string "rubricator", default: "000000", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social2021_points", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "region_id"
    t.text "budget_clasification_info"
    t.string "agreement_number"
    t.string "capital_construction_object_name"
    t.string "address", null: false
    t.string "point_type"
    t.string "power"
    t.string "construction_time"
    t.float "maximum_cost"
    t.text "purchase_ref"
    t.string "work_stage"
    t.text "comment"
    t.date "finish_date"
    t.integer "monitorings_count", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social2021_st2_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data"
    t.date "photo_date"
    t.bigint "social2021_st2_monitoring_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social2021_st2_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.date "verified_date", null: false
    t.string "verifier"
    t.string "stage", null: false
    t.string "fact_plan_deadline"
    t.text "comment"
    t.string "timeline", null: false
    t.bigint "social2021_st2_point_id"
    t.string "rubricator", default: "000000", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social2021_st2_points", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "region_id"
    t.text "budget_classification_info"
    t.string "capital_construction_object_name"
    t.string "address", null: false
    t.string "point_type"
    t.string "power"
    t.string "construction_time"
    t.float "maximum_cost"
    t.text "purchase_ref"
    t.string "work_stage"
    t.text "comment"
    t.date "finish_date"
    t.integer "monitorings_count", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social_links", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_answers", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "account_id"
    t.bigint "survey_question_id"
    t.integer "survey_choice_id"
    t.string "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "device_uid"
    t.text "image_data"
    t.integer "location_id"
    t.string "location_type"
    t.integer "rank"
    t.bigint "survey_run_id"
  end

  create_table "survey_choices", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "survey_question_id"
    t.string "text"
    t.text "image_data"
    t.integer "next_survey_question_id"
    t.boolean "is_custom", default: false
    t.integer "position", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "exclusive", default: false
  end

  create_table "survey_question_comments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "survey_question_id"
    t.bigint "account_id"
    t.string "device_uid"
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "survey_run_id"
  end

  create_table "survey_questions", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "survey_id"
    t.text "text"
    t.text "image_data"
    t.integer "question_type"
    t.boolean "is_split", default: false
    t.integer "position", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "max_choices"
    t.string "location_type"
    t.integer "min_choices"
    t.boolean "optional", default: false
    t.boolean "with_comment", default: false
    t.string "comment_caption"
    t.integer "account_type"
    t.integer "min"
    t.integer "max"
    t.integer "next_survey_question_id"
    t.boolean "phone_confirmation", default: false
  end

  create_table "survey_reports", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "survey_id"
    t.text "file_data"
    t.integer "account_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "report_type"
    t.integer "user_id"
  end

  create_table "survey_results", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "survey_id"
    t.bigint "account_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "device_uid"
    t.integer "location_id"
    t.string "location_type"
  end

  create_table "survey_runs", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "survey_id"
    t.bigint "account_id"
    t.string "device_uid"
    t.string "location_type"
    t.bigint "location_id"
    t.datetime "started_at", precision: nil, default: -> { "now()" }, null: false
    t.datetime "finished_at", precision: nil
    t.string "phone"
    t.boolean "phone_confirmed", default: false
    t.string "phone_confirm_code"
    t.datetime "phone_confirm_code_expire_at", precision: nil
  end

  create_table "surveys", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.integer "platform_id"
    t.string "title"
    t.text "description"
    t.text "info"
    t.datetime "from", precision: nil
    t.datetime "to", precision: nil
    t.integer "survey_questions_count", default: 0
    t.integer "average_time"
    t.datetime "push_sent_at", precision: nil
    t.string "jid"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "account_type", default: 0
    t.boolean "access_by_uid", default: false
    t.string "uid", null: false
    t.boolean "access_for_region_manager", default: false
  end

  create_table "surveys_target_audiences", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "target_audience_id"
    t.bigint "survey_id"
  end

  create_table "target_audiences", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "target_filters", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "target_audience_id"
    t.string "filterable_type"
    t.bigint "filterable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yard_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "file_data"
    t.string "timeline", null: false
    t.bigint "yard_bad_territory_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "yard_bad_territories", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "address", null: false
    t.text "comment"
    t.string "territory_type", null: false
    t.integer "inspection_year", null: false
    t.bigint "yard_monitoring_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "yard_monitorings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.boolean "program_actualize", default: false, null: false
    t.integer "yard_2018", default: 0, null: false
    t.integer "yard_2018_monitoring", default: 0, null: false
    t.integer "bad_yard_2018", default: 0, null: false
    t.integer "yard_2018_students", default: 0, null: false
    t.text "yard_2018_students_comment"
    t.integer "territory_2018", default: 0, null: false
    t.integer "territory_2018_monitoring", default: 0, null: false
    t.integer "bad_territory_2018", default: 0, null: false
    t.integer "territory_2018_students", default: 0, null: false
    t.text "territory_2018_students_comment"
    t.integer "yard_2019", default: 0, null: false
    t.integer "yard_onf_2019", default: 0, null: false
    t.integer "bad_yard_2019", default: 0, null: false
    t.integer "territory_2019", default: 0, null: false
    t.integer "territory_onf_2019", default: 0, null: false
    t.integer "bad_territory_2019", default: 0, null: false
    t.bigint "yard_municipal_formation_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "yard_municipal_formations", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title", null: false
    t.string "grade"
    t.boolean "onf_activist", null: false
    t.string "activist_full_name"
    t.integer "population_count"
    t.integer "member_count"
    t.integer "social_member_count"
    t.boolean "program_presence", null: false
    t.string "program_url"
    t.text "program_comment"
    t.boolean "voting_presence", null: false
    t.text "voting_comment"
    t.bigint "yard_region_competency_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "yard_region_competencies", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "rik_full_name", null: false
    t.string "coordinator_full_name", null: false
    t.string "impact", null: false
    t.text "comment"
    t.integer "municipal_formation_count", default: 0, null: false
    t.bigint "region_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

end

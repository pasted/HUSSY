# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111102105529) do

  create_table "admissions", :force => true do |t|
    t.date     "date_admitted"
    t.date     "date_discharged"
    t.string   "itu_admitted"
    t.string   "itu_days"
    t.date     "itu_date"
    t.integer  "hospital_id"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assays", :force => true do |t|
    t.string   "category"
    t.string   "name"
    t.string   "description"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characteristics", :force => true do |t|
    t.string   "category"
    t.string   "name"
    t.string   "unit"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conditions", :force => true do |t|
    t.string   "present"
    t.string   "category"
    t.date     "onset_date"
    t.integer  "conditionable_id"
    t.string   "conditionable_type"
    t.integer  "classification_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultations", :force => true do |t|
    t.date     "consulted_date"
    t.string   "current_state"
    t.string   "traveled_recently"
    t.string   "notification"
    t.date     "notification_date"
    t.boolean  "notification_date_unknown"
    t.integer  "patient_id"
    t.integer  "medic_id"
    t.integer  "admission_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "bloody_diarrhoea"
    t.date     "onset_bloody_diarrhoea"
    t.boolean  "onset_bloody_diarrhoea_unknown"
    t.string   "hus"
    t.date     "onset_hus"
    t.boolean  "onset_hus_unknown"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employments", :force => true do |t|
    t.integer  "medic_id"
    t.integer  "hospital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ethnicities", :force => true do |t|
    t.string   "code"
    t.string   "group_code"
    t.string   "group_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospitals", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investigations", :force => true do |t|
    t.integer  "consultation_id"
    t.integer  "assay_id"
    t.string   "value"
    t.date     "date_of_test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medics", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organisms", :force => true do |t|
    t.string   "name"
    t.string   "serotype"
    t.string   "phagetype"
    t.string   "molis_reference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outcomes", :force => true do |t|
    t.string   "category"
    t.string   "details"
    t.string   "present"
    t.integer  "consultation_id"
    t.integer  "result_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "current_state"
    t.string   "encrypted_nhs_number"
    t.string   "encrypted_initials"
    t.string   "encrypted_postcode"
    t.string   "encrypted_town_of_birth"
    t.string   "encrypted_sex"
    t.string   "encrypted_year_of_birth"
    t.string   "encrypted_mortality"
    t.string   "encrypted_date_of_death"
    t.string   "encrypted_cause_of_death"
    t.boolean  "dod_unknown"
    t.integer  "ethnicity_id"
    t.string   "encrypted_ethnicity_other"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physicals", :force => true do |t|
    t.integer  "patient_id"
    t.date     "date_taken"
    t.integer  "characteristic_id"
    t.string   "measure"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prescriptions", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "drug_id"
    t.string   "prescribed"
    t.date     "prescribed_date"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.string   "category"
    t.text     "property_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referrals", :force => true do |t|
    t.string   "referred"
    t.date     "original_admission_date"
    t.string   "centre_name"
    t.string   "consultant_name"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.string   "category"
    t.integer  "consultation_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specimen", :force => true do |t|
    t.string   "stool_sample_submitted"
    t.date     "stool_sample_date"
    t.string   "stool_sample_lab"
    t.string   "stool_reference"
    t.date     "stool_reference_date"
    t.boolean  "stool_reference_date_unknown"
    t.string   "serum_reference"
    t.date     "serum_reference_date"
    t.boolean  "serum_reference_date_unknown"
    t.string   "organism_identified"
    t.string   "antibodies_detected"
    t.string   "organism_name"
    t.string   "organism_serotype"
    t.string   "organism_phagetype"
    t.string   "molis_reference"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "therapies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travels", :force => true do |t|
    t.integer  "consultation_id"
    t.string   "visited"
    t.date     "arrived"
    t.date     "departed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatments", :force => true do |t|
    t.string   "type"
    t.string   "treated"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "consultation_id"
    t.integer  "therapy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.string   "title"
    t.string   "telephone"
    t.string   "current_state"
    t.integer  "hospital_id"
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "viewers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20170724201640) do

  create_table "anti_viri", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "client_id"
    t.string "rep"
    t.string "username"
    t.string "rim_password"
    t.integer "licence_number"
    t.string "licence_key"
    t.integer "computer_id"
    t.integer "service_type_id"
    t.integer "service_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "service_date"
    t.datetime "next_service_date"
    t.text "note"
    t.date "contact_date1"
    t.date "contact_date2"
    t.date "contact_date3"
    t.boolean "contact_done1"
    t.boolean "contact_done2"
    t.boolean "contact_done3"
    t.integer "rim_service"
    t.string "rim_contact"
    t.string "rim_email"
    t.string "rim_phone"
    t.string "rim_computer"
    t.boolean "active"
    t.index ["client_id"], name: "index_anti_viri_on_client_id"
    t.index ["computer_id"], name: "index_anti_viri_on_computer_id"
    t.index ["service_list_id"], name: "index_anti_viri_on_service_list_id"
    t.index ["service_type_id"], name: "index_anti_viri_on_service_type_id"
  end

  create_table "b_tasks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "backup_id"
    t.text "details"
    t.text "description"
    t.string "status_name"
    t.string "communication_name"
    t.integer "status_id"
    t.integer "communication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "task_time"
    t.string "backup_account"
    t.string "system"
    t.integer "todo_list_id"
    t.index ["backup_id"], name: "index_b_tasks_on_backup_id"
    t.index ["todo_list_id"], name: "index_b_tasks_on_todo_list_id"
  end

  create_table "backup_pcs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "notes"
    t.boolean "active"
    t.integer "labtech_computer_id"
    t.integer "labtech_client_id"
    t.integer "service_list_id"
    t.integer "contract_service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "external_hd"
    t.string "serial"
    t.integer "client_id"
    t.integer "backup_id"
    t.integer "computer_id"
    t.string "name"
    t.index ["backup_id"], name: "index_backup_pcs_on_backup_id"
    t.index ["client_id"], name: "index_backup_pcs_on_client_id"
    t.index ["computer_id"], name: "index_backup_pcs_on_computer_id"
    t.index ["contract_service_id"], name: "index_backup_pcs_on_contract_service_id"
    t.index ["labtech_client_id"], name: "index_backup_pcs_on_labtech_client_id"
    t.index ["labtech_computer_id"], name: "index_backup_pcs_on_labtech_computer_id"
    t.index ["service_list_id"], name: "index_backup_pcs_on_service_list_id"
  end

  create_table "backups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "notes"
    t.integer "client_id"
    t.date "signup_date"
    t.date "renewal_date"
    t.integer "assigned_to_id"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "it_service_id"
    t.decimal "qty", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "price", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "total_price", precision: 12, scale: 2, default: "0.0", null: false
    t.string "backup_account"
    t.string "backup_size"
    t.integer "size_used"
    t.decimal "used_percent", precision: 12, scale: 2, default: "0.0", null: false
    t.string "alerts"
    t.integer "devices"
    t.string "client_first_name"
    t.string "client_last_name"
    t.string "client_full_name"
    t.datetime "service_date"
    t.datetime "next_service_date"
    t.date "contact_date1"
    t.date "contact_date2"
    t.date "contact_date3"
    t.boolean "contact_done1"
    t.boolean "contact_done2"
    t.boolean "contact_done3"
    t.string "rim_computer"
    t.integer "rim_service"
    t.string "rim_contact"
    t.string "rim_email"
    t.string "rim_phone"
    t.integer "service_list_id"
    t.integer "service_type_id"
    t.integer "computer_id"
    t.integer "rim_client"
    t.string "user_login"
    t.string "user_pass"
    t.boolean "business"
    t.boolean "residential"
    t.boolean "active"
    t.string "user_name"
    t.string "password"
    t.index ["client_id"], name: "index_backups_on_client_id"
    t.index ["computer_id"], name: "index_backups_on_computer_id"
    t.index ["service_list_id"], name: "index_backups_on_service_list_id"
    t.index ["service_type_id"], name: "index_backups_on_service_type_id"
  end

  create_table "clients", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.string "state"
    t.integer "zip_code"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "company"
    t.string "primary_contact"
    t.string "fax"
    t.string "cell"
    t.string "secondary_contact"
    t.string "backup_account"
    t.string "city"
    t.string "full_name"
    t.integer "other_clientid"
    t.integer "rim_client"
    t.string "address2"
    t.string "spouse_name"
    t.string "spouse_phone"
    t.string "email2"
    t.text "notes"
    t.string "customer"
    t.boolean "active"
    t.string "city_state_zip"
    t.index ["rim_client"], name: "fk_rails_77414ec4f3"
  end

  create_table "clients_owners", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "owner_id", null: false
    t.integer "client_id", null: false
  end

  create_table "comments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "body"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "communications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "backup_id"
    t.index ["backup_id"], name: "index_communications_on_backup_id"
    t.index ["client_id"], name: "index_communications_on_client_id"
  end

  create_table "computers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "make"
    t.string "model"
    t.string "serial_number"
    t.string "user_login"
    t.string "user_password"
    t.string "other_items"
    t.string "system_type"
    t.integer "client_id"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "operating_system"
    t.string "corepc_number"
    t.text "other_items2"
    t.text "other_items3"
    t.boolean "active"
    t.integer "LabtechComputer_id"
    t.integer "labtech_computer_id"
    t.index ["LabtechComputer_id"], name: "index_computers_on_LabtechComputer_id"
    t.index ["client_id"], name: "index_computers_on_client_id"
    t.index ["labtech_computer_id"], name: "index_computers_on_labtech_computer_id"
    t.index ["ticket_id"], name: "index_computers_on_ticket_id"
  end

  create_table "contract_service_lines", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "qty", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "tax_rate", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "tax", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "price", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "sub_total", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "total_price", precision: 12, scale: 2, default: "0.0", null: false
    t.text "line_comment"
    t.integer "contract_service_id"
    t.integer "service_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.index ["client_id"], name: "index_contract_service_lines_on_client_id"
    t.index ["contract_service_id"], name: "index_contract_service_lines_on_contract_service_id"
    t.index ["service_list_id"], name: "index_contract_service_lines_on_service_list_id"
  end

  create_table "contract_services", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rep"
    t.string "username"
    t.string "rim_password"
    t.integer "licence_number"
    t.string "licence_key"
    t.date "contact_date1"
    t.date "contact_date2"
    t.date "contact_date3"
    t.boolean "contact_done1"
    t.boolean "contact_done2"
    t.boolean "contact_done3"
    t.date "service_date"
    t.date "next_service_date"
    t.text "notes"
    t.string "rim_computer"
    t.integer "rim_service"
    t.string "rim_contact"
    t.string "rim_email"
    t.string "rim_phone"
    t.integer "rim_charge"
    t.integer "rim_client"
    t.integer "client_id"
    t.integer "computer_id"
    t.integer "service_list_id"
    t.integer "service_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "sub_total", precision: 12, scale: 2, default: "0.0"
    t.decimal "tax_total", precision: 12, scale: 2, default: "0.0"
    t.decimal "total", precision: 12, scale: 2, default: "0.0"
    t.integer "user_id"
    t.boolean "active"
    t.index ["client_id"], name: "index_contract_services_on_client_id"
    t.index ["computer_id"], name: "index_contract_services_on_computer_id"
    t.index ["service_list_id"], name: "index_contract_services_on_service_list_id"
    t.index ["service_type_id"], name: "index_contract_services_on_service_type_id"
    t.index ["user_id"], name: "index_contract_services_on_user_id"
  end

  create_table "diagnostics", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ticket_id"
    t.boolean "hard_drive"
    t.boolean "mem_test"
    t.boolean "mobo"
    t.integer "dumps"
    t.integer "scans"
    t.float "temp", limit: 24
    t.integer "chkdsk"
    t.integer "policies"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_diagnostics_on_ticket_id"
  end

  create_table "dispatches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "phone"
    t.text "details"
    t.integer "ticket"
    t.boolean "calendar"
    t.integer "billable_time"
    t.integer "non_billable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_dispatches_on_client_id"
    t.index ["user_id"], name: "index_dispatches_on_user_id"
  end

  create_table "events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "color"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_issues_on_client_id"
  end

  create_table "it_services", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.decimal "rate", precision: 10
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_categories_id"
  end

  create_table "items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "ticket_id"
    t.integer "computer_id"
    t.index ["client_id"], name: "index_items_on_client_id"
    t.index ["computer_id"], name: "index_items_on_computer_id"
    t.index ["ticket_id"], name: "index_items_on_ticket_id"
  end

  create_table "lab_ticket_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "lab_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labtech_audits", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "labtech_ticket"
    t.datetime "date"
    t.text "description"
    t.string "technician"
    t.string "category"
    t.decimal "time", precision: 5, scale: 2
    t.integer "cal_ticket"
    t.decimal "cal_time", precision: 5, scale: 2
    t.decimal "time_dif", precision: 5, scale: 2
    t.boolean "upadted"
    t.boolean "complete"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labtech_client_other_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "lclient_id"
    t.string "name"
    t.string "contract_rep"
    t.string "monthly_billable_time"
    t.string "monthly_emergency_time"
    t.string "monthly_non_billable_time"
    t.integer "servers_under_contract"
    t.integer "workstations_under_contract"
    t.integer "labtech_client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["labtech_client_id"], name: "index_labtech_client_other_data_on_labtech_client_id"
  end

  create_table "labtech_clients", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lclient_id"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "phone"
    t.string "name"
    t.string "zip_code"
    t.integer "support_mins"
  end

  create_table "labtech_computers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "labcomputer_id"
    t.integer "lclient_id"
    t.integer "lablocation_id"
    t.string "name"
    t.string "username"
    t.string "os"
    t.string "domain"
    t.integer "labtech_client_id"
    t.integer "labtech_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "backup_id"
    t.string "company"
    t.integer "clientid"
    t.integer "locationid"
    t.integer "computerid"
    t.datetime "lastcontact"
    t.index ["backup_id"], name: "index_labtech_computers_on_backup_id"
    t.index ["labtech_client_id"], name: "index_labtech_computers_on_labtech_client_id"
    t.index ["labtech_location_id"], name: "index_labtech_computers_on_labtech_location_id"
  end

  create_table "labtech_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "lclient_id"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "fax"
    t.text "comments"
    t.integer "labtech_client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lablocation_id"
    t.string "loc_name_id"
    t.integer "backup_id"
    t.index ["backup_id"], name: "index_labtech_locations_on_backup_id"
    t.index ["labtech_client_id"], name: "index_labtech_locations_on_labtech_client_id"
  end

  create_table "labtech_times", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "timeslip_id"
    t.integer "ticketid"
    t.integer "hours"
    t.integer "mins"
    t.boolean "done"
    t.datetime "lab_date"
    t.text "description"
    t.integer "user_id"
    t.integer "labticket_id"
    t.integer "labtech_client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lclient_id"
    t.decimal "total_hours", precision: 12, scale: 2
    t.decimal "total_min", precision: 12, scale: 2
    t.integer "support_mins"
    t.string "client_name"
    t.integer "labtech_id"
    t.integer "labmonth"
    t.index ["labtech_client_id"], name: "index_labtech_times_on_labtech_client_id"
    t.index ["labticket_id"], name: "index_labtech_times_on_labticket_id"
    t.index ["user_id"], name: "index_labtech_times_on_user_id"
  end

  create_table "labtech_timeslips", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "labtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "started_date"
    t.integer "mins"
    t.integer "hours"
    t.text "subject"
    t.integer "lab_clientid"
    t.integer "lab_ticketid"
    t.integer "labtech_client_id"
    t.integer "lab_ticket_status_id"
    t.index ["lab_ticket_status_id"], name: "index_labtech_timeslips_on_lab_ticket_status_id"
    t.index ["labtech_client_id"], name: "index_labtech_timeslips_on_labtech_client_id"
  end

  create_table "labtickets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "requestor_email"
    t.integer "lab_clientid"
    t.integer "status_id"
    t.integer "user_id"
    t.datetime "started_date"
    t.integer "hours"
    t.integer "mins"
    t.integer "category"
    t.integer "labtech_client_id"
    t.integer "labtech_timeslip_id"
    t.integer "labtechloc"
    t.integer "labtechpc"
    t.text "lab_request"
    t.text "time_subject"
    t.integer "labtech_location_id"
    t.integer "labtech_computer_id"
    t.integer "lab_ticket_status_id"
    t.index ["lab_ticket_status_id"], name: "index_labtickets_on_lab_ticket_status_id"
    t.index ["labtech_client_id"], name: "index_labtickets_on_labtech_client_id"
    t.index ["labtech_computer_id"], name: "index_labtickets_on_labtech_computer_id"
    t.index ["labtech_location_id"], name: "index_labtickets_on_labtech_location_id"
    t.index ["labtech_timeslip_id"], name: "index_labtickets_on_labtech_timeslip_id"
  end

  create_table "locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "contact"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "malwares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "repair_id"
    t.string "jrt"
    t.string "hitmanpro"
    t.string "adwcleaner"
    t.string "malwarebytes"
    t.string "virus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repair_id"], name: "index_malwares_on_repair_id"
  end

  create_table "parts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.decimal "cost", precision: 10
    t.decimal "price", precision: 10
    t.boolean "parts_on_order"
    t.boolean "parts_in"
    t.datetime "date_ordered"
    t.datetime "date_received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "parts_ordered_date"
    t.datetime "parts_received_date"
    t.string "part_one"
    t.string "part_two"
    t.string "part_three"
    t.string "part_four"
    t.string "part_five"
    t.decimal "part_cost_one", precision: 5, scale: 2
    t.decimal "part_cost_two", precision: 5, scale: 2
    t.decimal "part_cost_three", precision: 5, scale: 2
    t.decimal "part_cost_four", precision: 5, scale: 2
    t.decimal "part_cost_five", precision: 5, scale: 2
    t.integer "ticket_id"
    t.integer "client_id"
    t.integer "client_repair"
    t.integer "other_clientid"
    t.index ["client_id"], name: "index_parts_on_client_id"
    t.index ["ticket_id"], name: "index_parts_on_ticket_id"
  end

  create_table "priorities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_priorities_on_client_id"
  end

  create_table "projects", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "percent_complete", precision: 10
  end

  create_table "repair_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repair_malware_cleans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "removed"
    t.text "details"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repairs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "percent_complete", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "repair_category_id"
    t.index ["repair_category_id"], name: "index_repairs_on_repair_category_id"
  end

  create_table "service_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "charge", precision: 10
    t.integer "workstation"
    t.integer "server"
    t.integer "antivirus"
    t.integer "backup"
    t.integer "hours"
    t.integer "email"
    t.integer "office"
    t.integer "reoccurrence"
    t.boolean "monthly"
    t.boolean "yearly"
    t.boolean "two_year"
    t.boolean "one_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "service_type_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_service_lists_on_client_id"
    t.index ["service_type_id"], name: "index_service_lists_on_service_type_id"
  end

  create_table "service_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email_note1"
    t.string "email_note2"
    t.string "email_note3"
    t.string "email_note4"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_service_types_on_client_id"
  end

  create_table "stages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "string"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "systems", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "make"
    t.string "model"
    t.string "serial_number"
    t.string "user_login"
    t.string "user_password"
    t.string "other_items"
    t.string "system_type"
    t.integer "client_id"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_systems_on_client_id"
    t.index ["ticket_id"], name: "index_systems_on_ticket_id"
  end

  create_table "task_options", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "todo_list_id"
    t.index ["todo_list_id"], name: "index_task_options_on_todo_list_id"
  end

  create_table "tasks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "description"
    t.boolean "done"
    t.integer "todo_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_list_id"], name: "index_tasks_on_todo_list_id"
  end

  create_table "ticket_comments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ticket_id"
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "backup_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.index ["backup_id"], name: "index_ticket_comments_on_backup_id"
    t.index ["ticket_id"], name: "index_ticket_comments_on_ticket_id"
  end

  create_table "tickets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "ticket_title"
    t.text "description"
    t.date "due_date"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "issue_id"
    t.integer "priority_id"
    t.integer "user_id"
    t.integer "status_id"
    t.string "tech"
    t.date "expected_date"
    t.date "received_date"
    t.date "completed_date"
    t.date "invoiced_date"
    t.boolean "follow_up_call"
    t.date "pickup_date"
    t.boolean "pickup"
    t.integer "client_repair"
    t.string "contact"
    t.integer "location_id"
    t.text "fix_notes"
    t.text "invoice_notes"
    t.index ["client_id"], name: "index_tickets_on_client_id"
    t.index ["location_id"], name: "index_tickets_on_location_id"
    t.index ["status_id"], name: "index_tickets_on_status_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "time_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "time_catid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "labtech_time_id"
    t.index ["labtech_time_id"], name: "index_time_categories_on_labtech_time_id"
  end

  create_table "todo_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "backup_id"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "ticket_id"
    t.boolean "complete"
    t.index ["backup_id"], name: "index_todo_lists_on_backup_id"
    t.index ["client_id"], name: "index_todo_lists_on_client_id"
    t.index ["ticket_id"], name: "index_todo_lists_on_ticket_id"
    t.index ["user_id"], name: "index_todo_lists_on_user_id"
  end

  create_table "types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.boolean "admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.integer "labtech_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "anti_viri", "clients"
  add_foreign_key "anti_viri", "computers"
  add_foreign_key "anti_viri", "service_lists"
  add_foreign_key "anti_viri", "service_types"
  add_foreign_key "b_tasks", "backups"
  add_foreign_key "backup_pcs", "backups"
  add_foreign_key "backup_pcs", "clients"
  add_foreign_key "backup_pcs", "computers"
  add_foreign_key "backups", "clients"
  add_foreign_key "computers", "clients"
  add_foreign_key "computers", "labtech_computers"
  add_foreign_key "computers", "tickets"
  add_foreign_key "contract_service_lines", "clients"
  add_foreign_key "contract_service_lines", "contract_services"
  add_foreign_key "contract_service_lines", "service_lists"
  add_foreign_key "contract_services", "clients"
  add_foreign_key "contract_services", "computers"
  add_foreign_key "contract_services", "service_lists"
  add_foreign_key "contract_services", "service_types"
  add_foreign_key "contract_services", "users"
  add_foreign_key "diagnostics", "tickets"
  add_foreign_key "issues", "clients"
  add_foreign_key "labtech_client_other_data", "labtech_clients"
  add_foreign_key "labtech_times", "labtech_clients"
  add_foreign_key "labtech_times", "labtickets"
  add_foreign_key "labtech_times", "users"
  add_foreign_key "malwares", "repairs"
  add_foreign_key "priorities", "clients"
  add_foreign_key "service_types", "clients"
  add_foreign_key "systems", "clients"
  add_foreign_key "systems", "tickets"
  add_foreign_key "tasks", "todo_lists"
  add_foreign_key "ticket_comments", "tickets"
  add_foreign_key "tickets", "clients"
  add_foreign_key "time_categories", "labtech_times"
end

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160708052433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_emailaddress", force: :cascade do |t|
    t.string  "email",    limit: 254, null: false
    t.boolean "verified",             null: false
    t.boolean "primary",              null: false
    t.integer "user_id",              null: false
    t.index "email varchar_pattern_ops", name: "account_emailaddress_email_03be32b2_like", using: :btree
    t.index ["email"], name: "account_emailaddress_email_key", unique: true, using: :btree
    t.index ["user_id"], name: "account_emailaddress_e8701ad4", using: :btree
  end

  create_table "account_emailconfirmation", force: :cascade do |t|
    t.datetime "created",                     null: false
    t.datetime "sent"
    t.string   "key",              limit: 64, null: false
    t.integer  "email_address_id",            null: false
    t.index "key varchar_pattern_ops", name: "account_emailconfirmation_key_f43612bd_like", using: :btree
    t.index ["email_address_id"], name: "account_emailconfirmation_6f1edeac", using: :btree
    t.index ["key"], name: "account_emailconfirmation_key_key", unique: true, using: :btree
  end

  create_table "accounts_typeuser", force: :cascade do |t|
    t.string   "password",     limit: 128, null: false
    t.datetime "last_login"
    t.boolean  "is_superuser",             null: false
    t.string   "username",     limit: 30,  null: false
    t.string   "first_name",   limit: 30,  null: false
    t.string   "last_name",    limit: 30,  null: false
    t.string   "email",        limit: 254, null: false
    t.boolean  "is_staff",                 null: false
    t.boolean  "is_active",                null: false
    t.datetime "date_joined",              null: false
    t.string   "user_type",    limit: 20,  null: false
    t.index "username varchar_pattern_ops", name: "accounts_typeuser_username_e50228cf_like", using: :btree
    t.index ["username"], name: "accounts_typeuser_username_key", unique: true, using: :btree
  end

  create_table "accounts_typeuser_groups", force: :cascade do |t|
    t.integer "typeuser_id", null: false
    t.integer "group_id",    null: false
    t.index ["group_id"], name: "accounts_typeuser_groups_0e939a4f", using: :btree
    t.index ["typeuser_id", "group_id"], name: "accounts_typeuser_groups_typeuser_id_35432da6_uniq", unique: true, using: :btree
    t.index ["typeuser_id"], name: "accounts_typeuser_groups_f016d098", using: :btree
  end

  create_table "accounts_typeuser_user_permissions", force: :cascade do |t|
    t.integer "typeuser_id",   null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "accounts_typeuser_user_permissions_8373b171", using: :btree
    t.index ["typeuser_id", "permission_id"], name: "accounts_typeuser_user_permissions_typeuser_id_6c6fa1a9_uniq", unique: true, using: :btree
    t.index ["typeuser_id"], name: "accounts_typeuser_user_permissions_f016d098", using: :btree
  end

  create_table "auth_group", force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.index "name varchar_pattern_ops", name: "auth_group_name_a6ea08ec_like", using: :btree
    t.index ["name"], name: "auth_group_name_key", unique: true, using: :btree
  end

  create_table "auth_group_permissions", force: :cascade do |t|
    t.integer "group_id",      null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_0cd325b0_uniq", unique: true, using: :btree
    t.index ["group_id"], name: "auth_group_permissions_0e939a4f", using: :btree
    t.index ["permission_id"], name: "auth_group_permissions_8373b171", using: :btree
  end

  create_table "auth_permission", force: :cascade do |t|
    t.string  "name",            limit: 255, null: false
    t.integer "content_type_id",             null: false
    t.string  "codename",        limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_01ab375a_uniq", unique: true, using: :btree
    t.index ["content_type_id"], name: "auth_permission_417f1b1c", using: :btree
  end

  create_table "banks_bank", force: :cascade do |t|
    t.datetime "created",                     null: false
    t.datetime "modified",                    null: false
    t.string   "company_name",    limit: 255, null: false
    t.string   "dba",             limit: 255
    t.string   "business_type",   limit: 19
    t.boolean  "provides_loans",              null: false
    t.boolean  "provides_leases",             null: false
    t.boolean  "provides_ppas",               null: false
    t.boolean  "provides_cpace",              null: false
    t.string   "contact",         limit: 255
    t.string   "email",           limit: 254
    t.string   "website",         limit: 200
    t.string   "phone",           limit: 128, null: false
    t.string   "fax",             limit: 128
    t.string   "street_1",        limit: 255
    t.string   "street_2",        limit: 255
    t.string   "city",            limit: 255
    t.string   "state",           limit: 2
    t.string   "zipcode",         limit: 9
    t.integer  "created_by_id"
    t.index ["created_by_id"], name: "banks_bank_e93cb7eb", using: :btree
  end

  create_table "banks_person", force: :cascade do |t|
    t.string  "first_name",             limit: 255, null: false
    t.string  "last_name",              limit: 255, null: false
    t.string  "email",                  limit: 254, null: false
    t.string  "phone",                  limit: 128, null: false
    t.string  "fax",                    limit: 128
    t.string  "street_1",               limit: 255
    t.string  "street_2",               limit: 255
    t.string  "city",                   limit: 255
    t.string  "state",                  limit: 2
    t.string  "zipcode",                limit: 9
    t.string  "estimated_credit",       limit: 9
    t.boolean "authorize_credit_check"
    t.integer "fico_score",             limit: 2
  end

  create_table "credit_applications_commercialcreditapplication", force: :cascade do |t|
    t.datetime "created",                                         null: false
    t.datetime "modified",                                        null: false
    t.string   "status",                             limit: 100,  null: false
    t.datetime "status_changed",                                  null: false
    t.boolean  "complete_online",                                 null: false
    t.text     "estimated_economic_impact"
    t.string   "legal_business_name",                limit: 255
    t.string   "street_1",                           limit: 255
    t.string   "street_2",                           limit: 255
    t.string   "city",                               limit: 255
    t.string   "state",                              limit: 2
    t.string   "zipcode",                            limit: 9
    t.string   "contact",                            limit: 255
    t.string   "phone",                              limit: 128
    t.string   "fax",                                limit: 128
    t.string   "email",                              limit: 254
    t.string   "website",                            limit: 200
    t.date     "incorporation_date"
    t.integer  "under_current_ownership",            limit: 2
    t.integer  "number_of_employees",                limit: 2
    t.text     "ein"
    t.integer  "owner_count",                        limit: 2
    t.string   "entity_type",                        limit: 19
    t.string   "ticker",                             limit: 10
    t.integer  "annual_revenue"
    t.boolean  "profitable_past_two_years",                       null: false
    t.boolean  "personal_guarantee",                              null: false
    t.boolean  "authorize_business_credit_check"
    t.integer  "paydex",                             limit: 2
    t.integer  "experian_creditscore",               limit: 2
    t.text     "business_description"
    t.text     "parent_company"
    t.string   "commercial_credit_application_form", limit: 1024
    t.string   "bank_statements",                    limit: 1024
    t.string   "financial_statements",               limit: 1024
    t.boolean  "financial_statements_audited",                    null: false
    t.string   "financial_statements_2",             limit: 1024
    t.boolean  "financial_statements_2_audited",                  null: false
    t.string   "financial_statements_3",             limit: 1024
    t.boolean  "financial_statements_3_audited",                  null: false
    t.string   "corporate_tax_returns",              limit: 1024
    t.string   "corporate_tax_returns_2",            limit: 1024
    t.string   "corporate_tax_returns_3",            limit: 1024
    t.string   "profit_and_loss_statement",          limit: 1024
    t.string   "balance_sheet",                      limit: 1024
    t.boolean  "for_loans",                                       null: false
    t.boolean  "for_leases",                                      null: false
    t.boolean  "bank_references_complete",                        null: false
    t.boolean  "trade_references_complete",                       null: false
    t.boolean  "lease_loan_references_complete",                  null: false
    t.boolean  "agreed_and_accepted",                             null: false
    t.datetime "agreed_and_accepted_datetime"
    t.string   "agreed_and_accepted_by",             limit: 255
    t.integer  "customer_company_id"
    t.integer  "installer_id"
    t.index ["customer_company_id"], name: "credit_applications_commercialcreditapplication_8994c1a5", using: :btree
    t.index ["installer_id"], name: "credit_applications_commercialcreditapplication_b898f90f", using: :btree
  end

  create_table "credit_applications_commercialcreditapplication_commercial_4051", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplication_commerci_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "commercialcreditapplication_id", null: false
    t.integer "commercialproject_id",           null: false
    t.index ["commercialcreditapplication_id", "commercialproject_id"], name: "credit_application_commercialcreditapplication_id_be93b6db_uniq", unique: true, using: :btree
    t.index ["commercialcreditapplication_id"], name: "credit_applications_commercialcreditapplication_commercial_6319", using: :btree
    t.index ["commercialproject_id"], name: "credit_applications_commercialcreditapplication_commercial_6a8e", using: :btree
  end

  create_table "credit_applications_commercialcreditapplication_products", force: :cascade do |t|
    t.integer "commercialcreditapplication_id", null: false
    t.integer "product_id",                     null: false
    t.index ["commercialcreditapplication_id", "product_id"], name: "credit_application_commercialcreditapplication_id_660c9676_uniq", unique: true, using: :btree
    t.index ["commercialcreditapplication_id"], name: "credit_applications_commercialcreditapplication_products_e6732f", using: :btree
    t.index ["product_id"], name: "credit_applications_commercialcreditapplication_products_9b223f", using: :btree
  end

  create_table "credit_applications_commercialcreditapplicationbankreferencc81c", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplicationbankrefe_id_seq1'::regclass)" }, force: :cascade do |t|
    t.integer "commercialcreditapplicationbankreference_id", null: false
    t.integer "commercialcreditapplication_id",              null: false
    t.index ["commercialcreditapplication_id"], name: "credit_applications_commercialcreditapplicationbankreferenc35b2", using: :btree
    t.index ["commercialcreditapplicationbankreference_id", "commercialcreditapplication_id"], name: "credi_commercialcreditapplicationbankreference_id_dcb14c22_uniq", unique: true, using: :btree
    t.index ["commercialcreditapplicationbankreference_id"], name: "credit_applications_commercialcreditapplicationbankreference682", using: :btree
  end

  create_table "credit_applications_commercialcreditapplicationbankreference", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplicationbankrefer_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "bank",                limit: 255, null: false
    t.text   "bank_account_number",             null: false
    t.string "contact",             limit: 255, null: false
    t.string "phone",               limit: 128, null: false
  end

  create_table "credit_applications_commercialcreditapplicationleaseloanref2c4a", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplicationleaseloa_id_seq1'::regclass)" }, force: :cascade do |t|
    t.integer "commercialcreditapplicationleaseloanreference_id", null: false
    t.integer "commercialcreditapplication_id",                   null: false
    t.index ["commercialcreditapplication_id"], name: "credit_applications_commercialcreditapplicationleaseloanref47d0", using: :btree
    t.index ["commercialcreditapplicationleaseloanreference_id", "commercialcreditapplication_id"], name: "commercialcreditapplicationleaseloanreference_id_997c8612_uniq", unique: true, using: :btree
    t.index ["commercialcreditapplicationleaseloanreference_id"], name: "credit_applications_commercialcreditapplicationleaseloanref8439", using: :btree
  end

  create_table "credit_applications_commercialcreditapplicationleaseloanref52cb", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplicationleaseloan_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "company",           limit: 255, null: false
    t.string "lease_loan_number", limit: 100, null: false
    t.string "contact",           limit: 255, null: false
    t.string "phone",             limit: 128, null: false
  end

  create_table "credit_applications_commercialcreditapplicationownerpartnera1e0", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplicationownerpart_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "first_name",             limit: 255, null: false
    t.string  "last_name",              limit: 255, null: false
    t.string  "title",                  limit: 255, null: false
    t.string  "email",                  limit: 254, null: false
    t.string  "phone",                  limit: 128, null: false
    t.string  "street_1",               limit: 255, null: false
    t.string  "street_2",               limit: 255
    t.string  "city",                   limit: 255, null: false
    t.string  "state",                  limit: 2,   null: false
    t.string  "zipcode",                limit: 9,   null: false
    t.text    "social_security_number"
    t.date    "date_of_birth"
    t.float   "ownership_percentage",               null: false
    t.boolean "is_guarantor",                       null: false
    t.integer "credit_application_id"
    t.index ["credit_application_id"], name: "credit_applications_commercialcreditapplicationownerpartner451b", using: :btree
    t.index ["email", "credit_application_id"], name: "credit_applications_commercialcreditapplica_email_c5e039be_uniq", unique: true, using: :btree
  end

  create_table "credit_applications_commercialcreditapplicationpersonalfina9de0", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplicationpersonalf_id_seq'::regclass)" }, force: :cascade do |t|
    t.string   "status",                           limit: 100
    t.boolean  "complete_online",                                                        null: false
    t.string   "first_name",                       limit: 100
    t.string   "middle_name",                      limit: 100
    t.string   "last_name",                        limit: 100
    t.date     "date_of_birth"
    t.text     "social_security_number"
    t.string   "credit_type",                      limit: 22
    t.string   "spouse_first_name",                limit: 100
    t.string   "spouse_middle_name",               limit: 100
    t.string   "spouse_last_name",                 limit: 100
    t.date     "spouse_date_of_birth"
    t.text     "spouse_social_security_number"
    t.string   "street_1",                         limit: 255
    t.string   "street_2",                         limit: 255
    t.string   "city",                             limit: 255
    t.string   "state",                            limit: 2
    t.string   "zipcode",                          limit: 9
    t.string   "occupation",                       limit: 255
    t.boolean  "has_dependents",                                                         null: false
    t.integer  "number_of_dependents",             limit: 2
    t.boolean  "has_will",                                                               null: false
    t.string   "will_executor",                    limit: 255
    t.boolean  "is_defendant",                                                           null: false
    t.boolean  "has_claimed_bankruptcy",                                                 null: false
    t.date     "bankrputcy_date"
    t.decimal  "available_cash",                                precision: 13, scale: 2
    t.decimal  "us_government_securities",                      precision: 13, scale: 2
    t.decimal  "cash_value_of_life_insurance",                  precision: 13, scale: 2
    t.decimal  "publicly_traded_stocks",                        precision: 13, scale: 2
    t.decimal  "other_stocks_and_bonds",                        precision: 13, scale: 2
    t.decimal  "accounts_receivable",                           precision: 13, scale: 2
    t.decimal  "notes_receivable",                              precision: 13, scale: 2
    t.decimal  "real_estate",                                   precision: 13, scale: 2
    t.decimal  "automobiles",                                   precision: 13, scale: 2
    t.decimal  "notes_payable_to_banks_unsecured",              precision: 13, scale: 2
    t.decimal  "notes_payable_to_banks_secured",                precision: 13, scale: 2
    t.decimal  "life_insurance_loan",                           precision: 13, scale: 2
    t.decimal  "notes_payable_to_others",                       precision: 13, scale: 2
    t.decimal  "accounts_payable",                              precision: 13, scale: 2
    t.decimal  "taxes_and_assessments_payable",                 precision: 13, scale: 2
    t.decimal  "mortgages_on_real_estate",                      precision: 13, scale: 2
    t.decimal  "salary",                                        precision: 10, scale: 2
    t.decimal  "bonus_and_commissions",                         precision: 13, scale: 2
    t.decimal  "dividends",                                     precision: 13, scale: 2
    t.decimal  "real_estate_income",                            precision: 13, scale: 2
    t.decimal  "as_guarantor",                                  precision: 13, scale: 2
    t.decimal  "on_leases_or_contracts",                        precision: 13, scale: 2
    t.decimal  "legal_claims",                                  precision: 13, scale: 2
    t.decimal  "federal_income_tax",                            precision: 13, scale: 2
    t.string   "personal_financial_statement",     limit: 1024
    t.string   "offline_status",                   limit: 22
    t.string   "personal_tax_returns",             limit: 1024
    t.string   "personal_tax_returns_2",           limit: 1024
    t.string   "personal_tax_returns_3",           limit: 1024
    t.boolean  "bank_accounts_complete",                                                 null: false
    t.boolean  "banking_relations_complete",                                             null: false
    t.boolean  "notes_receivable_complete",                                              null: false
    t.boolean  "life_insurance_complete",                                                null: false
    t.boolean  "stocks_and_bonds_complete",                                              null: false
    t.boolean  "real_estate_complete",                                                   null: false
    t.boolean  "agreed_and_accepted",                                                    null: false
    t.datetime "agreed_and_accepted_datetime"
    t.string   "agreed_and_accepted_by",           limit: 255
    t.integer  "credit_application_id",                                                  null: false
    t.integer  "user_id"
    t.index ["credit_application_id"], name: "credit_applications_commercialcreditapplicationpersonalfinad0c0", using: :btree
    t.index ["user_id", "credit_application_id"], name: "credit_applications_commercialcreditappli_user_id_438d28c8_uniq", unique: true, using: :btree
    t.index ["user_id"], name: "credit_applications_commercialcreditapplicationpersonalfinad5a6", using: :btree
  end

  create_table "credit_applications_commercialcreditapplicationtradereferen13fb", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplicationtraderef_id_seq1'::regclass)" }, force: :cascade do |t|
    t.integer "commercialcreditapplicationtradereference_id", null: false
    t.integer "commercialcreditapplication_id",               null: false
    t.index ["commercialcreditapplication_id"], name: "credit_applications_commercialcreditapplicationtradereferencbae", using: :btree
    t.index ["commercialcreditapplicationtradereference_id", "commercialcreditapplication_id"], name: "cred_commercialcreditapplicationtradereference_id_74effa30_uniq", unique: true, using: :btree
    t.index ["commercialcreditapplicationtradereference_id"], name: "credit_applications_commercialcreditapplicationtradereferen6136", using: :btree
  end

  create_table "credit_applications_commercialcreditapplicationtradereference", id: :integer, default: -> { "nextval('credit_applications_commercialcreditapplicationtraderefe_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "company",        limit: 255, null: false
    t.string "account_number", limit: 100, null: false
    t.string "contact",        limit: 255, null: false
    t.string "phone",          limit: 128, null: false
  end

  create_table "credit_applications_ownercreditapplication", primary_key: "personalcreditapplication_ptr_id", id: :integer, force: :cascade do |t|
    t.integer "commercial_credit_application_id"
    t.index ["commercial_credit_application_id"], name: "credit_applications_ownercreditapplication_694d926f", using: :btree
  end

  create_table "credit_applications_personalcreditapplication", force: :cascade do |t|
    t.datetime "created",                                       null: false
    t.datetime "modified",                                      null: false
    t.string   "status",                           limit: 100,  null: false
    t.datetime "status_changed",                                null: false
    t.string   "first_name",                       limit: 255,  null: false
    t.string   "last_name",                        limit: 255,  null: false
    t.string   "email",                            limit: 254,  null: false
    t.string   "personal_credit_application_form", limit: 1024
    t.string   "personal_tax_returns",             limit: 1024
    t.integer  "user_id"
    t.index ["user_id"], name: "credit_applications_personalcreditapplication_e8701ad4", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementbankaccount", id: :integer, default: -> { "nextval('credit_applications_personalfinancialstatementbankaccoun_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "bank",                            limit: 255,                          null: false
    t.string  "phone",                           limit: 128,                          null: false
    t.decimal "cash_balance",                                precision: 13, scale: 2
    t.string  "account_type",                    limit: 255
    t.text    "bank_account_number",                                                  null: false
    t.string  "name_on_account",                 limit: 255,                          null: false
    t.integer "personal_financial_statement_id",                                      null: false
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementbankaccount_674d2", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementbankingrelation", id: :integer, default: -> { "nextval('credit_applications_personalfinancialstatementbankingrel_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "bank",                            limit: 255,                          null: false
    t.decimal "loan_amount",                                 precision: 13, scale: 2, null: false
    t.string  "loan_purpose",                    limit: 255,                          null: false
    t.date    "opening_date",                                                         null: false
    t.integer "loan_term",                       limit: 2,                            null: false
    t.boolean "loan_secured",                                                         null: false
    t.string  "loan_secured_description",        limit: 255
    t.integer "personal_financial_statement_id",                                      null: false
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementbankingrelati5974", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementlifeinsurance", id: :integer, default: -> { "nextval('credit_applications_personalfinancialstatementlifeinsura_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "name_of_insured",                 limit: 100,                          null: false
    t.string  "name_of_beneficiary",             limit: 100,                          null: false
    t.string  "name_of_insurance_company",       limit: 100,                          null: false
    t.decimal "yearly_premium",                              precision: 8,  scale: 2
    t.decimal "face_amount",                                 precision: 13, scale: 2
    t.decimal "cash_surrender_value",                        precision: 13, scale: 2
    t.decimal "loans_against_policy",                        precision: 13, scale: 2
    t.string  "policy_type",                     limit: 100,                          null: false
    t.integer "personal_financial_statement_id",                                      null: false
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementlifeinsurance1063", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementnotereceivable", id: :integer, default: -> { "nextval('credit_applications_personalfinancialstatementnotereceiv_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "debtor_name",                     limit: 100,                          null: false
    t.text    "debtor_address",                                                       null: false
    t.date    "opening_date",                                                         null: false
    t.string  "loan_purpose",                    limit: 255,                          null: false
    t.decimal "amount_owing",                                precision: 13, scale: 2
    t.integer "loan_term",                       limit: 2,                            null: false
    t.integer "personal_financial_statement_id",                                      null: false
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementnotereceivablaa96", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementotherasset", force: :cascade do |t|
    t.string  "description",                     limit: 255,                          null: false
    t.decimal "value",                                       precision: 13, scale: 2, null: false
    t.integer "personal_financial_statement_id"
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementotherasset_6d6cc1", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementothercontinge1569", id: :integer, default: -> { "nextval('credit_applications_personalfinancialstatementotherconti_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "description",                     limit: 255,                          null: false
    t.decimal "value",                                       precision: 13, scale: 2, null: false
    t.integer "personal_financial_statement_id"
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementothercontingea728", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementotherincome", id: :integer, default: -> { "nextval('credit_applications_personalfinancialstatementotherincom_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "description",                     limit: 255,                          null: false
    t.decimal "value",                                       precision: 13, scale: 2, null: false
    t.integer "personal_financial_statement_id"
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementotherincome_61b24", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementotherliability", id: :integer, default: -> { "nextval('credit_applications_personalfinancialstatementotherliabi_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "description",                     limit: 255,                          null: false
    t.decimal "value",                                       precision: 13, scale: 2, null: false
    t.integer "personal_financial_statement_id"
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementotherliabilit4f91", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementrealestate", force: :cascade do |t|
    t.string  "street_1",                        limit: 255
    t.string  "street_2",                        limit: 255
    t.string  "city",                            limit: 255
    t.string  "state",                           limit: 2
    t.string  "zipcode",                         limit: 9
    t.string  "title_in_name_of",                limit: 100,                          null: false
    t.boolean "is_rental",                                                            null: false
    t.date    "date_acquired",                                                        null: false
    t.decimal "cost",                                        precision: 13, scale: 2
    t.decimal "market_value",                                precision: 13, scale: 2
    t.decimal "mortgages",                                   precision: 13, scale: 2
    t.decimal "unpaid_balance",                              precision: 13, scale: 2
    t.integer "personal_financial_statement_id",                                      null: false
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementrealestate_6d0bbd", using: :btree
  end

  create_table "credit_applications_personalfinancialstatementstocksandbonds", id: :integer, default: -> { "nextval('credit_applications_personalfinancialstatementstocksandb_id_seq'::regclass)" }, force: :cascade do |t|
    t.string  "name_of_security",                limit: 100,                          null: false
    t.string  "registered_in_name",              limit: 100,                          null: false
    t.string  "pledged_to",                      limit: 100
    t.string  "ticker",                          limit: 10,                           null: false
    t.integer "shares",                                                               null: false
    t.decimal "cost",                                        precision: 13, scale: 2
    t.decimal "market_value",                                precision: 13, scale: 2
    t.integer "personal_financial_statement_id",                                      null: false
    t.index ["personal_financial_statement_id"], name: "credit_applications_personalfinancialstatementstocksandbond8c89", using: :btree
  end

  create_table "customer_invitations_commercialcustomerownerinvitation", force: :cascade do |t|
    t.datetime "created",                                      null: false
    t.datetime "modified",                                     null: false
    t.string   "status",                           limit: 100, null: false
    t.datetime "status_changed",                               null: false
    t.string   "email",                            limit: 254, null: false
    t.boolean  "accepted",                                     null: false
    t.string   "key",                              limit: 64,  null: false
    t.datetime "sent"
    t.string   "first_name",                       limit: 255, null: false
    t.string   "last_name",                        limit: 255, null: false
    t.text     "message"
    t.boolean  "preexisting_user"
    t.integer  "commercial_credit_application_id"
    t.integer  "customer_id"
    t.integer  "installer_id"
    t.integer  "invitor_id"
    t.integer  "project_id"
    t.index "key varchar_pattern_ops", name: "customer_invitations_commercialcustomerowneri_key_b8247ad2_like", using: :btree
    t.index ["commercial_credit_application_id"], name: "customer_invitations_commercialcustomerownerinvitation_694d926f", using: :btree
    t.index ["customer_id"], name: "customer_invitations_commercialcustomerownerinvitation_cb24373b", using: :btree
    t.index ["email", "commercial_credit_application_id"], name: "customer_invitations_commercialcustomerowne_email_da1ecfca_uniq", unique: true, using: :btree
    t.index ["installer_id"], name: "customer_invitations_commercialcustomerownerinvitation_b898f90f", using: :btree
    t.index ["invitor_id"], name: "customer_invitations_commercialcustomerownerinvitation_ec530610", using: :btree
    t.index ["key"], name: "customer_invitations_commercialcustomerownerinvitation_key_key", unique: true, using: :btree
    t.index ["project_id"], name: "customer_invitations_commercialcustomerownerinvitation_b098ad43", using: :btree
  end

  create_table "customers_commercialcustomer", primary_key: "customer_ptr_id", id: :integer, force: :cascade do |t|
    t.string  "company_name",                    limit: 255, null: false
    t.string  "dba",                             limit: 255
    t.string  "entity_type",                     limit: 19
    t.string  "contact",                         limit: 255
    t.string  "email",                           limit: 254, null: false
    t.string  "website",                         limit: 200
    t.string  "phone",                           limit: 128
    t.string  "fax",                             limit: 128
    t.string  "street_1",                        limit: 255
    t.string  "street_2",                        limit: 255
    t.string  "city",                            limit: 255
    t.string  "state",                           limit: 2
    t.string  "zipcode",                         limit: 9
    t.integer "years_in_business",               limit: 2
    t.integer "owner_count",                     limit: 2
    t.boolean "personal_guarantee",                          null: false
    t.text    "business_description"
    t.boolean "authorize_business_credit_check"
    t.integer "paydex",                          limit: 2
    t.integer "experian_creditscore",            limit: 2
    t.string  "ticker",                          limit: 10
  end

  create_table "customers_commercialcustomerowner", primary_key: "person_ptr_id", id: :integer, force: :cascade do |t|
    t.datetime "created",  null: false
    t.datetime "modified", null: false
  end

  create_table "customers_customer", force: :cascade do |t|
    t.datetime "created",      null: false
    t.datetime "modified",     null: false
    t.integer  "installer_id"
    t.index ["installer_id"], name: "customers_customer_b898f90f", using: :btree
  end

  create_table "django_admin_log", force: :cascade do |t|
    t.datetime "action_time",                 null: false
    t.text     "object_id"
    t.string   "object_repr",     limit: 200, null: false
    t.integer  "action_flag",     limit: 2,   null: false
    t.text     "change_message",              null: false
    t.integer  "content_type_id"
    t.integer  "user_id",                     null: false
    t.index ["content_type_id"], name: "django_admin_log_417f1b1c", using: :btree
    t.index ["user_id"], name: "django_admin_log_e8701ad4", using: :btree
  end

  create_table "django_content_type", force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_76bd3d3b_uniq", unique: true, using: :btree
  end

  create_table "django_migrations", force: :cascade do |t|
    t.string   "app",     limit: 255, null: false
    t.string   "name",    limit: 255, null: false
    t.datetime "applied",             null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, force: :cascade do |t|
    t.text     "session_data", null: false
    t.datetime "expire_date",  null: false
    t.index "session_key varchar_pattern_ops", name: "django_session_session_key_c0390e0f_like", using: :btree
    t.index ["expire_date"], name: "django_session_de54fa62", using: :btree
  end

  create_table "django_site", force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name",   limit: 50,  null: false
    t.index "domain varchar_pattern_ops", name: "django_site_domain_a2e37b91_like", using: :btree
    t.index ["domain"], name: "django_site_domain_a2e37b91_uniq", unique: true, using: :btree
  end

  create_table "installer", force: :cascade do |t|
    t.datetime "created",                           null: false
    t.datetime "modified",                          null: false
    t.string   "company_name",          limit: 255, null: false
    t.string   "dba",                   limit: 255
    t.string   "entity_type",           limit: 19
    t.integer  "years_in_business",     limit: 2
    t.string   "contact",               limit: 255
    t.string   "website",               limit: 200
    t.string   "phone",                 limit: 128, null: false
    t.string   "fax",                   limit: 128
    t.string   "street_1",              limit: 255
    t.string   "street_2",              limit: 255
    t.string   "city",                  limit: 255
    t.string   "state",                 limit: 2
    t.string   "zipcode",               limit: 9
    t.text     "resale_number"
    t.text     "ein"
    t.text     "authorized_dealer_for"
    t.text     "equipment_brands"
    t.text     "business_description"
    t.string   "primary_bank",          limit: 255
    t.string   "primary_bank_branch",   limit: 255
    t.string   "bank_phone",            limit: 128
    t.string   "bank_contact",          limit: 255
    t.text     "bank_account_number"
    t.integer  "created_by_id"
    t.string   "email",                 limit: 254
    t.index ["created_by_id"], name: "installer_e93cb7eb", using: :btree
  end

  create_table "installers_installerowner", primary_key: "person_ptr_id", id: :integer, force: :cascade do |t|
    t.integer "ownership",    limit: 2
    t.integer "installer_id"
    t.index ["installer_id"], name: "installers_installerowner_b898f90f", using: :btree
  end

  create_table "installers_tradereference", force: :cascade do |t|
    t.string  "company",      limit: 255, null: false
    t.string  "contact",      limit: 255, null: false
    t.string  "phone",        limit: 128, null: false
    t.integer "installer_id"
    t.index ["installer_id"], name: "installers_tradereference_b898f90f", using: :btree
  end

  create_table "invitations_invitation", force: :cascade do |t|
    t.string   "email",      limit: 254, null: false
    t.boolean  "accepted",               null: false
    t.datetime "created",                null: false
    t.string   "key",        limit: 64,  null: false
    t.datetime "sent"
    t.integer  "inviter_id"
    t.index "email varchar_pattern_ops", name: "invitations_invitation_email_d5c8f421_like", using: :btree
    t.index "key varchar_pattern_ops", name: "invitations_invitation_key_a9d4efbc_like", using: :btree
    t.index ["email"], name: "invitations_invitation_email_key", unique: true, using: :btree
    t.index ["inviter_id"], name: "invitations_invitation_d9678107", using: :btree
    t.index ["key"], name: "invitations_invitation_key_key", unique: true, using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.string   "base_url"
    t.string   "filter"
    t.string   "final_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_product", force: :cascade do |t|
    t.string  "name",                                  limit: 255,                          null: false
    t.string  "availability_by_state",                 limit: 194
    t.text    "description"
    t.string  "sample_product_agreement",              limit: 100
    t.decimal "max_system_price",                                  precision: 11, scale: 2
    t.decimal "min_system_price",                                  precision: 11, scale: 2
    t.integer "min_years_in_business",                 limit: 2
    t.decimal "min_ownership_for_pfs",                             precision: 5,  scale: 2
    t.string  "forbidden_business_types",              limit: 255
    t.string  "specialty_business_types",              limit: 255
    t.string  "product_type",                          limit: 13
    t.jsonb   "product_details"
    t.integer "term",                                  limit: 2,                            null: false
    t.string  "payment_frequency",                     limit: 13
    t.boolean "construction_financing_available",                                           null: false
    t.boolean "commercial_credit_application",                                              null: false
    t.boolean "business_questionnaire",                                                     null: false
    t.integer "years_financial_statements",            limit: 2,                            null: false
    t.integer "years_corporate_tax_returns",           limit: 2,                            null: false
    t.boolean "profit_and_loss_statement",                                                  null: false
    t.boolean "balance_sheet",                                                              null: false
    t.decimal "personal_guarantee_employee_cutoff",                precision: 9,  scale: 2
    t.decimal "peronsal_guarantee_revenue_cutoff",                 precision: 13, scale: 2
    t.boolean "personal_guarantee_cutoff_both",                                             null: false
    t.boolean "personal_financial_statement_required",                                      null: false
    t.integer "years_personal_tax_returns",            limit: 2,                            null: false
    t.decimal "effective_interest_rate",                           precision: 3,  scale: 2
    t.integer "provider_id"
    t.decimal "buyout_payment_factor",                             precision: 5,  scale: 4, null: false
    t.decimal "down_payment_factor",                               precision: 5,  scale: 4, null: false
    t.decimal "monthly_payment_factor",                            precision: 6,  scale: 5, null: false
    t.index ["provider_id"], name: "products_product_32ca2ddc", using: :btree
  end

  create_table "projects_commercialproject", force: :cascade do |t|
    t.datetime "created",                                                       null: false
    t.datetime "modified",                                                      null: false
    t.string   "status",                  limit: 100,                           null: false
    t.datetime "status_changed",                                                null: false
    t.string   "name",                    limit: 255,                           null: false
    t.decimal  "system_cost",                          precision: 12,           null: false
    t.decimal  "system_size",                          precision: 6,  scale: 2, null: false
    t.decimal  "system_area",                          precision: 10,           null: false
    t.string   "panel_make",              limit: 255,                           null: false
    t.string   "panel_model",             limit: 255
    t.integer  "panel_count"
    t.string   "inverter_make",           limit: 255,                           null: false
    t.string   "inverter_model",          limit: 255
    t.string   "mount_type",              limit: 255,                           null: false
    t.text     "description"
    t.string   "project_phase",           limit: 255,                           null: false
    t.date     "construction_start_date"
    t.date     "interconnection_date"
    t.string   "street_1",                limit: 255
    t.string   "street_2",                limit: 255
    t.string   "city",                    limit: 255
    t.string   "state",                   limit: 2
    t.string   "zipcode",                 limit: 9
    t.string   "production_report",       limit: 1024
    t.integer  "customer_id"
    t.integer  "installer_id"
    t.index ["customer_id"], name: "projects_commercialproject_cb24373b", using: :btree
    t.index ["installer_id"], name: "projects_commercialproject_b898f90f", using: :btree
  end

  create_table "socialaccount_socialaccount", force: :cascade do |t|
    t.string   "provider",    limit: 30,  null: false
    t.string   "uid",         limit: 191, null: false
    t.datetime "last_login",              null: false
    t.datetime "date_joined",             null: false
    t.text     "extra_data",              null: false
    t.integer  "user_id",                 null: false
    t.index ["provider", "uid"], name: "socialaccount_socialaccount_provider_fc810c6e_uniq", unique: true, using: :btree
    t.index ["user_id"], name: "socialaccount_socialaccount_e8701ad4", using: :btree
  end

  create_table "socialaccount_socialapp", force: :cascade do |t|
    t.string "provider",  limit: 30,  null: false
    t.string "name",      limit: 40,  null: false
    t.string "client_id", limit: 191, null: false
    t.string "secret",    limit: 191, null: false
    t.string "key",       limit: 191, null: false
  end

  create_table "socialaccount_socialapp_sites", force: :cascade do |t|
    t.integer "socialapp_id", null: false
    t.integer "site_id",      null: false
    t.index ["site_id"], name: "socialaccount_socialapp_sites_9365d6e7", using: :btree
    t.index ["socialapp_id", "site_id"], name: "socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq", unique: true, using: :btree
    t.index ["socialapp_id"], name: "socialaccount_socialapp_sites_fe95b0a0", using: :btree
  end

  create_table "socialaccount_socialtoken", force: :cascade do |t|
    t.text     "token",        null: false
    t.text     "token_secret", null: false
    t.datetime "expires_at"
    t.integer  "account_id",   null: false
    t.integer  "app_id",       null: false
    t.index ["account_id"], name: "socialaccount_socialtoken_8a089c2a", using: :btree
    t.index ["app_id", "account_id"], name: "socialaccount_socialtoken_app_id_fca4e0ac_uniq", unique: true, using: :btree
    t.index ["app_id"], name: "socialaccount_socialtoken_f382adfe", using: :btree
  end

  create_table "user_profiles_bankuserprofile", force: :cascade do |t|
    t.datetime "created",  null: false
    t.datetime "modified", null: false
    t.integer  "bank_id"
    t.integer  "user_id"
    t.index ["bank_id"], name: "user_profiles_bankuserprofile_0b0af02d", using: :btree
    t.index ["user_id"], name: "user_profiles_bankuserprofile_user_id_key", unique: true, using: :btree
  end

  create_table "user_profiles_commercialcustomeruserprofile", force: :cascade do |t|
    t.datetime "created",  null: false
    t.datetime "modified", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "user_profiles_commercialcustomeruserprofile_user_id_key", unique: true, using: :btree
  end

  create_table "user_profiles_commercialcustomeruserprofile_commercial_cred0f5e", id: :integer, default: -> { "nextval('user_profiles_commercialcustomeruserprofile_commercial_c_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "commercialcustomeruserprofile_id", null: false
    t.integer "commercialcreditapplication_id",   null: false
    t.index ["commercialcreditapplication_id"], name: "user_profiles_commercialcustomeruserprofile_commercial_creddd67", using: :btree
    t.index ["commercialcustomeruserprofile_id", "commercialcreditapplication_id"], name: "user_profiles_co_commercialcustomeruserprofile_id_6cb49347_uniq", unique: true, using: :btree
    t.index ["commercialcustomeruserprofile_id"], name: "user_profiles_commercialcustomeruserprofile_commercial_cred351f", using: :btree
  end

  create_table "user_profiles_commercialcustomeruserscompanies", force: :cascade do |t|
    t.boolean "is_owner"
    t.integer "ownership",                   limit: 2
    t.integer "commercial_customer_id"
    t.integer "commercial_customer_user_id"
    t.index ["commercial_customer_id"], name: "user_profiles_commercialcustomeruserscompanies_7270dc4b", using: :btree
    t.index ["commercial_customer_user_id"], name: "user_profiles_commercialcustomeruserscompanies_2917585b", using: :btree
  end

  create_table "user_profiles_commercialcustomerusersinstallers", force: :cascade do |t|
    t.integer "commercial_customer_user_id"
    t.integer "installer_id"
    t.index ["commercial_customer_user_id"], name: "user_profiles_commercialcustomerusersinstallers_2917585b", using: :btree
    t.index ["installer_id"], name: "user_profiles_commercialcustomerusersinstallers_b898f90f", using: :btree
  end

  create_table "user_profiles_installeruserprofile", force: :cascade do |t|
    t.datetime "created",      null: false
    t.datetime "modified",     null: false
    t.integer  "installer_id"
    t.integer  "user_id"
    t.index ["installer_id"], name: "user_profiles_installeruserprofile_b898f90f", using: :btree
    t.index ["user_id"], name: "user_profiles_installeruserprofile_user_id_key", unique: true, using: :btree
  end

  create_table "user_profiles_ownership", force: :cascade do |t|
    t.integer "ownership",  limit: 2
    t.integer "company_id"
    t.integer "owner_id"
    t.index ["company_id"], name: "user_profiles_ownership_447d3092", using: :btree
    t.index ["owner_id"], name: "user_profiles_ownership_5e7b1936", using: :btree
  end

  add_foreign_key "account_emailaddress", "accounts_typeuser", column: "user_id", name: "account_emailaddress_user_id_2c513194_fk_accounts_typeuser_id"
  add_foreign_key "account_emailconfirmation", "account_emailaddress", column: "email_address_id", name: "account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id"
  add_foreign_key "accounts_typeuser_groups", "accounts_typeuser", column: "typeuser_id", name: "accounts_typeuser__typeuser_id_19d4be21_fk_accounts_typeuser_id"
  add_foreign_key "accounts_typeuser_groups", "auth_group", column: "group_id", name: "accounts_typeuser_groups_group_id_bfb1ccff_fk_auth_group_id"
  add_foreign_key "accounts_typeuser_user_permissions", "accounts_typeuser", column: "typeuser_id", name: "accounts_typeuser__typeuser_id_4ffc75d6_fk_accounts_typeuser_id"
  add_foreign_key "accounts_typeuser_user_permissions", "auth_permission", column: "permission_id", name: "accounts_typeuser__permission_id_79a96f6f_fk_auth_permission_id"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id"
  add_foreign_key "banks_bank", "accounts_typeuser", column: "created_by_id", name: "banks_bank_created_by_id_2a89ec22_fk_accounts_typeuser_id"
  add_foreign_key "credit_applications_commercialcreditapplication", "customers_commercialcustomer", column: "customer_company_id", primary_key: "customer_ptr_id", name: "D0dc9361ed4de68ed7b13b3fdc6c31e0"
  add_foreign_key "credit_applications_commercialcreditapplication", "installer", name: "credit_applications_comme_installer_id_e92b71b4_fk_installer_id"
  add_foreign_key "credit_applications_commercialcreditapplication_commercial_4051", "credit_applications_commercialcreditapplication", column: "commercialcreditapplication_id", name: "c1cc2a99e6eda317b87eff17bb3aa9fa"
  add_foreign_key "credit_applications_commercialcreditapplication_commercial_4051", "projects_commercialproject", column: "commercialproject_id", name: "commercialproject_id_35f1c3e8_fk_projects_commercialproject_id"
  add_foreign_key "credit_applications_commercialcreditapplication_products", "credit_applications_commercialcreditapplication", column: "commercialcreditapplication_id", name: "D929bc9f06200f52cad970f6c88412a9"
  add_foreign_key "credit_applications_commercialcreditapplication_products", "products_product", column: "product_id", name: "credit_applications__product_id_10e1e77e_fk_products_product_id"
  add_foreign_key "credit_applications_commercialcreditapplicationbankreferencc81c", "credit_applications_commercialcreditapplication", column: "commercialcreditapplication_id", name: "de7c69572b9496dc995ea65d405adfc0"
  add_foreign_key "credit_applications_commercialcreditapplicationbankreferencc81c", "credit_applications_commercialcreditapplicationbankreference", column: "commercialcreditapplicationbankreference_id", name: "ead3f3f57909c544b22f6a6874ea72b4"
  add_foreign_key "credit_applications_commercialcreditapplicationleaseloanref2c4a", "credit_applications_commercialcreditapplication", column: "commercialcreditapplication_id", name: "D758d21d7fb0f2dcf1b8f68475d111b2"
  add_foreign_key "credit_applications_commercialcreditapplicationleaseloanref2c4a", "credit_applications_commercialcreditapplicationleaseloanref52cb", column: "commercialcreditapplicationleaseloanreference_id", name: "D2457b5fa86d9985b907aa40244cbf8d"
  add_foreign_key "credit_applications_commercialcreditapplicationownerpartnera1e0", "credit_applications_commercialcreditapplication", column: "credit_application_id", name: "D14ba5a1f8730595aa6700acd58fe742"
  add_foreign_key "credit_applications_commercialcreditapplicationpersonalfina9de0", "accounts_typeuser", column: "user_id", name: "credit_applications_co_user_id_0ab45d21_fk_accounts_typeuser_id"
  add_foreign_key "credit_applications_commercialcreditapplicationpersonalfina9de0", "credit_applications_commercialcreditapplication", column: "credit_application_id", name: "D026a98d92107d7b01c157e5e7948888"
  add_foreign_key "credit_applications_commercialcreditapplicationtradereferen13fb", "credit_applications_commercialcreditapplication", column: "commercialcreditapplication_id", name: "D1e1404ad9769e8b7f0f2dd80c67c425"
  add_foreign_key "credit_applications_commercialcreditapplicationtradereferen13fb", "credit_applications_commercialcreditapplicationtradereference", column: "commercialcreditapplicationtradereference_id", name: "D4a031268c09971604f6d8c85057e773"
  add_foreign_key "credit_applications_ownercreditapplication", "credit_applications_commercialcreditapplication", column: "commercial_credit_application_id", name: "D40f495de16d38ff703ba0f8e87bd5ba"
  add_foreign_key "credit_applications_ownercreditapplication", "credit_applications_personalcreditapplication", column: "personalcreditapplication_ptr_id", name: "a35fc59802ea9d99221da599e8d7e3b1"
  add_foreign_key "credit_applications_personalcreditapplication", "accounts_typeuser", column: "user_id", name: "credit_applications_pe_user_id_4c9c1630_fk_accounts_typeuser_id"
  add_foreign_key "credit_applications_personalfinancialstatementbankaccount", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "b02209628bbddf85667a7dc9c5de10dc"
  add_foreign_key "credit_applications_personalfinancialstatementbankingrelation", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "D60873f43d55312c6acf68435db55e27"
  add_foreign_key "credit_applications_personalfinancialstatementlifeinsurance", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "D5ec1fd5e28be54a398266923ee5f968"
  add_foreign_key "credit_applications_personalfinancialstatementnotereceivable", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "D5a73bdf1555f28b916a5a3c16188d53"
  add_foreign_key "credit_applications_personalfinancialstatementotherasset", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "D73299e24f3750f9ec49e26ab3d2f854"
  add_foreign_key "credit_applications_personalfinancialstatementothercontinge1569", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "e824db8f504d4bbfcb7b407c1bdd605c"
  add_foreign_key "credit_applications_personalfinancialstatementotherincome", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "D67adb1d853a746808f64e1f78411993"
  add_foreign_key "credit_applications_personalfinancialstatementotherliability", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "d352e9e40c878490de77bb8e21b27d27"
  add_foreign_key "credit_applications_personalfinancialstatementrealestate", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "D4bb1b97baf8dfef67880fe574827b2a"
  add_foreign_key "credit_applications_personalfinancialstatementstocksandbonds", "credit_applications_commercialcreditapplicationpersonalfina9de0", column: "personal_financial_statement_id", name: "D75dd5e01ec8d2f392248a37f685fa18"
  add_foreign_key "customer_invitations_commercialcustomerownerinvitation", "accounts_typeuser", column: "invitor_id", name: "customer_invitation_invitor_id_4637396d_fk_accounts_typeuser_id"
  add_foreign_key "customer_invitations_commercialcustomerownerinvitation", "credit_applications_commercialcreditapplication", column: "commercial_credit_application_id", name: "ef00b4bdb4fe089d843ce3dd0e1c3f47"
  add_foreign_key "customer_invitations_commercialcustomerownerinvitation", "customers_commercialcustomer", column: "customer_id", primary_key: "customer_ptr_id", name: "c57803e29b6220ca93994bc94dc12f3e"
  add_foreign_key "customer_invitations_commercialcustomerownerinvitation", "installer", name: "customer_invitations_comm_installer_id_ac0b5a87_fk_installer_id"
  add_foreign_key "customer_invitations_commercialcustomerownerinvitation", "projects_commercialproject", column: "project_id", name: "customer_i_project_id_01b12bf1_fk_projects_commercialproject_id"
  add_foreign_key "customers_commercialcustomer", "customers_customer", column: "customer_ptr_id", name: "customers_com_customer_ptr_id_f187e5da_fk_customers_customer_id"
  add_foreign_key "customers_commercialcustomerowner", "banks_person", column: "person_ptr_id", name: "customers_commercialc_person_ptr_id_6021be92_fk_banks_person_id"
  add_foreign_key "customers_customer", "installer", name: "customers_customer_installer_id_99475029_fk_installer_id"
  add_foreign_key "django_admin_log", "accounts_typeuser", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_accounts_typeuser_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_content_type_id_c4bce8eb_fk_django_content_type_id"
  add_foreign_key "installer", "accounts_typeuser", column: "created_by_id", name: "installer_created_by_id_8020efa8_fk_accounts_typeuser_id"
  add_foreign_key "installers_installerowner", "banks_person", column: "person_ptr_id", name: "installers_installero_person_ptr_id_d0da8f99_fk_banks_person_id"
  add_foreign_key "installers_installerowner", "installer", name: "installers_installerowner_installer_id_5aa309fe_fk_installer_id"
  add_foreign_key "installers_tradereference", "installer", name: "installers_tradereference_installer_id_6f5b354e_fk_installer_id"
  add_foreign_key "invitations_invitation", "accounts_typeuser", column: "inviter_id", name: "invitations_invitat_inviter_id_83070e1a_fk_accounts_typeuser_id"
  add_foreign_key "products_product", "banks_bank", column: "provider_id", name: "products_product_provider_id_adc09d6c_fk_banks_bank_id"
  add_foreign_key "projects_commercialproject", "customers_commercialcustomer", column: "customer_id", primary_key: "customer_ptr_id", name: "D0db7c69f6a52cf55c3aa5d2d9602831"
  add_foreign_key "projects_commercialproject", "installer", name: "projects_commercialprojec_installer_id_38c9407c_fk_installer_id"
  add_foreign_key "socialaccount_socialaccount", "accounts_typeuser", column: "user_id", name: "socialaccount_socialac_user_id_8146e70c_fk_accounts_typeuser_id"
  add_foreign_key "socialaccount_socialapp_sites", "django_site", column: "site_id", name: "socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id"
  add_foreign_key "socialaccount_socialapp_sites", "socialaccount_socialapp", column: "socialapp_id", name: "socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id"
  add_foreign_key "socialaccount_socialtoken", "socialaccount_socialaccount", column: "account_id", name: "socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id"
  add_foreign_key "socialaccount_socialtoken", "socialaccount_socialapp", column: "app_id", name: "socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id"
  add_foreign_key "user_profiles_bankuserprofile", "accounts_typeuser", column: "user_id", name: "user_profiles_bankuser_user_id_45d95089_fk_accounts_typeuser_id"
  add_foreign_key "user_profiles_bankuserprofile", "banks_bank", column: "bank_id", name: "user_profiles_bankuserprofile_bank_id_21dfc80b_fk_banks_bank_id"
  add_foreign_key "user_profiles_commercialcustomeruserprofile", "accounts_typeuser", column: "user_id", name: "user_profiles_commerci_user_id_4b7e391e_fk_accounts_typeuser_id"
  add_foreign_key "user_profiles_commercialcustomeruserprofile_commercial_cred0f5e", "credit_applications_commercialcreditapplication", column: "commercialcreditapplication_id", name: "D8b50aca28b1653e4880685c7794b7ec"
  add_foreign_key "user_profiles_commercialcustomeruserprofile_commercial_cred0f5e", "user_profiles_commercialcustomeruserprofile", column: "commercialcustomeruserprofile_id", name: "D8fdc0f7cd08d618c5ae4d911f145649"
  add_foreign_key "user_profiles_commercialcustomeruserscompanies", "customers_commercialcustomer", column: "commercial_customer_id", primary_key: "customer_ptr_id", name: "d30a32d227927e0e549c7f94436b1571"
  add_foreign_key "user_profiles_commercialcustomeruserscompanies", "user_profiles_commercialcustomeruserprofile", column: "commercial_customer_user_id", name: "D1adfcf2727f87cb04a14b456925fd18"
  add_foreign_key "user_profiles_commercialcustomerusersinstallers", "installer", name: "user_profiles_commercialc_installer_id_0c59bea5_fk_installer_id"
  add_foreign_key "user_profiles_commercialcustomerusersinstallers", "user_profiles_commercialcustomeruserprofile", column: "commercial_customer_user_id", name: "d8c9293d66d31ab361bd191924e078e6"
  add_foreign_key "user_profiles_installeruserprofile", "accounts_typeuser", column: "user_id", name: "user_profiles_installe_user_id_a3d9b51d_fk_accounts_typeuser_id"
  add_foreign_key "user_profiles_installeruserprofile", "installer", name: "user_profiles_installerus_installer_id_1d27da11_fk_installer_id"
  add_foreign_key "user_profiles_ownership", "customers_commercialcustomer", column: "company_id", primary_key: "customer_ptr_id", name: "D5d84e9e1dfcf59e9a7751f754a8c801"
  add_foreign_key "user_profiles_ownership", "customers_commercialcustomerowner", column: "owner_id", primary_key: "person_ptr_id", name: "D315129409b4b9dfadc464f5f30cfb22"
end

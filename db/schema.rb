# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_20_185235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "tipo"
    t.string "cpf"
    t.string "cnpj"
    t.string "nome"
    t.string "razão_social"
    t.string "endereco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_clientes_on_deleted_at"
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  end

  create_table "contas", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.decimal "saldo", default: "0.0"
    t.string "agencia", default: "100"
    t.string "numero", default: "0001"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["cliente_id"], name: "index_contas_on_cliente_id"
    t.index ["deleted_at"], name: "index_contas_on_deleted_at"
  end

  create_table "depositos", force: :cascade do |t|
    t.decimal "valor"
    t.string "nome"
    t.string "sobrenome"
    t.string "cpf"
    t.string "ddd"
    t.string "telefone"
    t.string "numero_conta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transferencias", force: :cascade do |t|
    t.decimal "valor"
    t.bigint "conta_origem_id"
    t.bigint "conta_destino_id"
    t.decimal "taxa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conta_destino_id"], name: "index_transferencias_on_conta_destino_id"
    t.index ["conta_origem_id"], name: "index_transferencias_on_conta_origem_id"
  end

  add_foreign_key "contas", "clientes"
end

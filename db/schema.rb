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

ActiveRecord::Schema.define(version: 20150324234448) do

  create_table "actividades", force: true do |t|
    t.string   "diaActual"
    t.string   "horaEntrada"
    t.string   "horaSalida"
    t.string   "actividad"
    t.string   "diaLetra"
    t.string   "horasTrabajadas"
    t.string   "dias"
    t.string   "medioDia"
    t.string   "HorasExtra"
    t.string   "horaRemoto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "id_consultora"
    t.string   "id_consultor"
    t.string   "id_proyecto"
    t.string   "mes"
    t.string   "ano"
  end

  create_table "asignaciones", force: true do |t|
    t.string   "id_consultora"
    t.string   "email"
    t.string   "cliente"
    t.string   "proyecto"
    t.string   "horaInicio"
    t.string   "horaFin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultoras", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consultoras", ["email"], name: "index_consultoras_on_email", unique: true

  create_table "consultores", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "cliente"
    t.string   "proyecto"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string  "access"
    t.string  "multiproyecto"
    t.string  "multiempresa"
    t.string   "horaEntrada"
    t.string   "horaSalida"
  end

  create_table "customers", force: true do |t|
    t.string   "nombre"
    t.string   "razonSocial"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fechas", force: true do |t|
    t.string   "fecha"
    t.string   "mes"
    t.string   "dia"
    t.string   "diaL"
    t.string   "mesL"
    t.string   "año"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitados", force: true do |t|
    t.string   "id_consultora"
    t.string   "emailInvitado"
    t.string   "emailConsultor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "nombre"
    t.string   "razonSocial"
    t.string   "direccion"
    t.string   "contacto"
    t.string   "email"
    t.string   "telOficina"
    t.string   "telMovil"
    t.string   "apellidos"
    t.string   "puesto"
    t.string   "logo"
    t.string   "foto"
    t.string   "type"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proyectos", force: true do |t|
    t.string   "cliente"
    t.string   "lider"
    t.string   "gerente"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombreProyecto"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string  "invitado"
    t.string   "email_consultor"
    t.string   "email_consultora"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

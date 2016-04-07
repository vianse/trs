json.array!(@profiles) do |profile|
  json.extract! profile, :id, :nombre, :razonSocial, :direccion, :contacto, :email, :telOficina, :telMovil, :apellidos, :puesto, :logo, :foto, :type, :user_id
  json.url profile_url(profile, format: :json)
end

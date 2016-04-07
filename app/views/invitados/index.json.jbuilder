json.array!(@invitados) do |invitado|
  json.extract! invitado, :id, :id_consultora, :emailInvitado, :emailConsultor
  json.url invitado_url(invitado, format: :json)
end

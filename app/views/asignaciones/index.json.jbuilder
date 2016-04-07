json.array!(@asignaciones) do |asignacione|
  json.extract! asignacione, :id, :id_consultora, :email, :cliente, :proyecto, :horaInicio, :horaFin
  json.url asignacione_url(asignacione, format: :json)
end

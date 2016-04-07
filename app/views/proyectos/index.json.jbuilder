json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :cliente, :lider, :gerente, :user_id
  json.url proyecto_url(proyecto, format: :json)
end

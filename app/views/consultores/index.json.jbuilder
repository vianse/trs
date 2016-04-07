json.array!(@consultores) do |consultore|
  json.extract! consultore, :id, :nombre, :email, :cliente, :proyecto, :user_id
  json.url consultore_url(consultore, format: :json)
end

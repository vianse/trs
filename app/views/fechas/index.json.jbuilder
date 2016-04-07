json.array!(@fechas) do |fecha|
  json.extract! fecha, :id, :fecha, :mes, :dia, :diaL, :mesL, :año
  json.url fecha_url(fecha, format: :json)
end

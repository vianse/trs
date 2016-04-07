json.array!(@actividades) do |actividade|
  json.extract! actividade, :id, :diaActual, :horaEntrada, :horaSalida, :actividad, :diaLetra, :horasTrabajadas, :dias, :medioDia, :HorasExtra, :horaRemoto
  json.url actividade_url(actividade, format: :json)
end

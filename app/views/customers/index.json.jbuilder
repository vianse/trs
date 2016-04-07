json.array!(@customers) do |customer|
  json.extract! customer, :id, :nombre, :razonSocial, :user_id
  json.url customer_url(customer, format: :json)
end

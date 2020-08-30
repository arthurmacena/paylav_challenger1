json.extract! report, :id, :purchase_name, :description, :price, :count, :address, :merchant_name, :created_at, :updated_at
json.url report_url(report, format: :json)

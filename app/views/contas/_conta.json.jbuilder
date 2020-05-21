json.extract! conta, :id, :cliente_id, :saldo, :agencia, :numero, :status, :created_at, :updated_at
json.url conta_url(conta, format: :json)

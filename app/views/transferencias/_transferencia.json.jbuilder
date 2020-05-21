json.extract! transferencia, :id, :valor, :conta_origem_id, :conta_destino_id, :taxa, :created_at, :updated_at
json.url transferencia_url(transferencia, format: :json)

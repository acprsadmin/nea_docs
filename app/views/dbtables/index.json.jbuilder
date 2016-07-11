json.array!(@dbtables) do |dbtable|
  json.extract! dbtable, :id, :name, :dbname, :description, :tabletype
  json.url dbtable_url(dbtable, format: :json)
end

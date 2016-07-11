json.array!(@dbfields) do |dbfield|
  json.extract! dbfield, :id, :name, :dbname, :description, :fieldtype
  json.url dbfield_url(dbfield, format: :json)
end

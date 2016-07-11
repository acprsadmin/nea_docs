json.array!(@sections) do |section|
  json.extract! section, :id, :name, :body, :ordernum, :chapter_id
  json.url section_url(section, format: :json)
end

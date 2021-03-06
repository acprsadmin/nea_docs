json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :name, :body, :ordernum, :book_id
  json.url chapter_url(chapter, format: :json)
end

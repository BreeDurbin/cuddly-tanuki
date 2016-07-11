json.array!(@languages) do |language|
  json.extract! language, :id, :language_type
  json.url language_url(language, format: :json)
end

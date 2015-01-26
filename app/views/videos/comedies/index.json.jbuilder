json.array!(@comedies) do |comedy|
  json.extract! comedy, :url, :mdata, :img
  json.url comedy_url(comedy, format: :json)
end
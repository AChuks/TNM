json.array!(@newest_fashions) do |newest_fashion|
  json.extract! newest_fashion, :url, :mdata, :img
  json.url newest_fashion_url(newest_fashion, format: :json)
end
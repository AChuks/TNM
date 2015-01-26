json.array!(@trend_fashions) do |trend_fashion|
  json.extract! trend_fashion, :url, :mdata, :img
  json.url trend_fashion_url(trend_fashion, format: :json)
end
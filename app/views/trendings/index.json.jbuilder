json.array!(@trendings) do |trending|
  json.extract! trending, :url, :title, :date, :meta_data
  json.url trending_url(trending, format: :json)
end
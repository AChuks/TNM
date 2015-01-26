json.array!(@webseries) do |webseries|
  json.extract! webseries, :url, :string, :metadata, :string, :thumbimg, :string
  json.url webseries_url(webseries, format: :json)
end
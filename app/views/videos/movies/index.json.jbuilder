json.array!(@movies) do |movie|
  json.extract! movie, :url, :mdata, :img
  json.url movie_url(movie, format: :json)
end
json.array!(@musics) do |music|
  json.extract! music, :url, :mdata, :img
  json.url music_url(music, format: :json)
end
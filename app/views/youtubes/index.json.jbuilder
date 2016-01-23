json.array!(@youtubes) do |youtube|
  json.extract! youtube, :url, :title, :date, :meta_data
  json.url youtube_url(youtube, format: :json)
end
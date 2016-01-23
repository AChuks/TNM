json.array!(@videos) do |video|
  json.extract! video, :url, :title, :date, :meta_data
  json.url video_url(video, format: :json)
end
json.array!(@videos) do |video|
  json.extract! video, :url, :mdata, :img
  json.url video_url(video, format: :json)
end
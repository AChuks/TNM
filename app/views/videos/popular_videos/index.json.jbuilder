json.array!(@popular_videos) do |popular_video|
  json.extract! popular_video, :url, :mdata, :img
  json.url popular_video_url(popular_video, format: :json)
end
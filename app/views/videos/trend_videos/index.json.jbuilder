json.array!(@trend_videos) do |trend_video|
  json.extract! trend_video, :url, :mdata, :img
  json.url trend_video_url(trend_video, format: :json)
end
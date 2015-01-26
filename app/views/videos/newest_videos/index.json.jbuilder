json.array!(@newest_videos) do |newest_video|
  json.extract! newest_video, :url, :mdata, :img
  json.url newest_video_url(newest_video, format: :json)
end
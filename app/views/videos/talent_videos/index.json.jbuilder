json.array!(@talent_videos) do |talent_video|
  json.extract! talent_video, :url, :mdata, :img
  json.url talent_video_url(talent_video, format: :json)
end
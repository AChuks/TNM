module VideosHelper
	def get_related_videos(meta_data)
		@related_videos = Youtube.same_meta_data_as(meta_data)
		return @related_videos
	end


	def get_approved_submitted_videos()
		@submitted_videos = Video.all
		return @submitted_videos
	end
end

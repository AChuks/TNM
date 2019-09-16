module VideosHelper

  def getChannels()
    channel_1 = 'https://www.youtube.com/user/ChiefObiDaFOB'
    channel_2 = 'https://www.youtube.com/user/AfricanComedians'
    channel_3 = 'https://www.youtube.com/user/kliff555'
    channel_4 = 'https://www.youtube.com/user/cooldami'
    channel_5 = 'https://www.youtube.com/user/WoWoBoyz'
    channel_6 = 'https://www.youtube.com/user/MrCrazeclown'
    channel_7 = 'https://www.youtube.com/channel/UC9DV-TcZUO48BtHtCcv1Ovw'
    channel_8 = 'https://www.youtube.com/user/AYTVAYTV'
    channel_9 = 'https://www.youtube.com/user/comedyliveshow'
    channel_10 = 'https://www.youtube.com/user/StandupNigeriaComedy'
    channel_10 = 'https://www.youtube.com/channel/UCnWrwhh4HyP3lNM_SkYsTQg'
    # return [channel_1, channel_2, channel_3, channel_4, channel_5, channel_6, channel_7, channel_8, channel_9, channel_10]
    return [channel_1]
  end

	def get_related_videos(meta_data)
		@related_videos = Youtube.same_meta_data_as(meta_data)
		return @related_videos
	end

  def get_trending_videos()
    channels = getChannels()
    if Trending.all.blank?
      channels.each { |each_channel| 
        each_channel= Yt::Channel.new url: each_channel
        channel_trends = each_channel.videos.where(order: 'date').map.first(2)
        channel_trends.each {|each_channel_trends| 
        Trending.create(:url => each_channel_trends.id, :title => each_channel_trends.title.tr('#',''), :date => each_channel_trends.published_at, :meta_data => each_channel_trends.channel_id) }
      }

    end
    @trending_videos = Trending.all.shuffle
    return @trending_videos
  end
  def get_youtube_videos()
    channels = getChannels()
    if Youtube.all.blank?
      channels.each {|each_channel| 
        each_channel = Yt::Channel.new url: each_channel
        each_channel.videos.map { |e| 
          Youtube.create(:url => e.id, :title => e.title.tr('#',''), :date => e.published_at, :meta_data => e.channel_id)
      }}
      # Add processed uploaded videos to Youtube table
      @processedVideos = Video.has_youtube_url()
      if @processedVideos.size > 0
        @processedVideos.each { |video|
          Youtube.create(:url => video.youtube_url, :title => video.title.tr('#',''), :date => video.updated_at, :meta_data => 'UCnWrwhh4HyP3lNM_SkYsTQg')
        }
      end
    end
    @youtube_videos = Youtube.paginate(page: params[:page],:per_page => 61).order('date DESC')
    return @youtube_videos
  end
end

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
    channel_11 = 'https://www.youtube.com/channel/UCizXhcdxVu-7bBDEmJ99yRQ'
    channel_12 = 'https://www.youtube.com/channel/UC2iwgQq9nvW0MkxJn7jI0XQ'
    channel_13 ='https://www.youtube.com/channel/UCCQ-qN-4JcmXe4GcktUsITg'
    channel_14 = 'https://www.youtube.com/channel/UC4JoLGDc4qhyP5p6Vgs8qXQ'
    channel_15 = 'https://www.youtube.com/user/TheLaughFactory'
    channel_16 = 'https://www.youtube.com/channel/UCBNQ6onTgCLMOg1McrQ859A'
    channel_17 = 'https://www.youtube.com/user/justforlaughscomedy'
    return [channel_1, channel_2, channel_3, channel_4, channel_5, channel_6, channel_7, channel_8, channel_9, channel_10, channel_11, channel_12, channel_13, channel_14, channel_15, channel_16, channel_17]
  end

	def get_related_youtube_videos(meta_data)
		@related_videos = Youtube.same_meta_data_as(meta_data)
		return @related_videos
	end

  def get_related_videos(author_email)
    related_uploaded_videos = Video.same_author_email(author_email).has_vimeo_video_id
    youtube_videos = Youtube.order("RANDOM()").limit(10)
    @related_videos = (related_uploaded_videos + youtube_videos)
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
  def get_all_videos()
    channels = getChannels()
    if Youtube.all.blank?
      channels.each {|each_channel| 
        each_channel = Yt::Channel.new url: each_channel
        each_channel.videos.map { |e| 
          Youtube.create(:url => e.id, :title => e.title.tr('#',''), :date => e.published_at, :meta_data => e.channel_id)
      }}
    end
    @uploaded_videos = Video.has_vimeo_video_id()
    @youtube_videos = Youtube.all
    @all_videos = (@uploaded_videos + @youtube_videos).sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 61)
    return @all_videos
  end

  def get_search_filtered_videos(search_text)
    @filtered_youtube_videos = Youtube.search(@search_text)
    @filtered_uploaded_videos = Video.search(@search_text)
    @filtered_videos = (@filtered_youtube_videos + @filtered_uploaded_videos).sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 31)
  end
end

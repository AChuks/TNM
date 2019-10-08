module VideosHelper

  def getChannels()
    channel_1 = 'UC9YvlExCwL2gh9H8bE63aDA' 
    channel_2 = 'UCY1ZateUFcH6K-UyM3J4PoA'
    channel_3 = 'UCpSy6fz3rORXNrsodFo3mFQ'
    channel_4 = 'UCMJsaAgrrwkPgHLKYGGjYlg'
    channel_5 = 'UCTC1SIC5HTcKaLd4eJTmp1w'
    channel_6 = 'UCwukLrqPe4ywJTe0RWVlBSA'
    channel_7 = 'UCvO4Ym5LjYTo0uZRfUvtc-w'
    channel_8 = 'UCwemICO9grnv9xkvFkoRvMA'
    channel_9 = 'UCizXhcdxVu-7bBDEmJ99yRQ'
    channel_10 = 'UC2iwgQq9nvW0MkxJn7jI0XQ'
    channel_11 ='UCCQ-qN-4JcmXe4GcktUsITg'
    channel_12 = 'UC4JoLGDc4qhyP5p6Vgs8qXQ'
    channel_13 = 'UCxyCzPY2pjAjrxoSYclpuLg'
    channel_14 = 'UCBNQ6onTgCLMOg1McrQ859A'
    channel_15 = 'UCqq3PZwp8Ob8_jN0esCunIw'
    channel_16 = 'UCtw7q4SyOeoCwM1i_3x8lDg'
    return [channel_1, channel_2, channel_3, channel_4, channel_5, channel_6, channel_7, channel_8, channel_9, channel_10, channel_11, channel_12, channel_13, channel_14, channel_15, channel_16]
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
        each_channel= Yt::Channel.new id: each_channel
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
        puts each_channel 
        each_channel = Yt::Channel.new id: each_channel
        each_channel.videos.map { |e| 
          Youtube.create(:url => e.id, :title => e.title.tr('#',''), :date => e.published_at, :meta_data => e.channel_id)
      }}
    end
    @uploaded_videos = Video.has_vimeo_video_id()
    @youtube_videos = Youtube.all
    @all_videos = (@uploaded_videos + @youtube_videos).sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 60)
    @trending_videos = get_trending_videos()
    @videos_info = {allVideos: @all_videos, trendingVideos: @trending_videos, currentPage: @all_videos.current_page, totalPages: @all_videos.total_pages}
    return @videos_info
  end

  def get_search_filtered_videos(search_text)
    @filtered_youtube_videos = Youtube.search(search_text)
    @filtered_uploaded_videos = Video.search(search_text)
    @filtered_videos = (@filtered_youtube_videos + @filtered_uploaded_videos).sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 60)
    @videos_info = {searchedVideos: @filtered_videos, searchedText: search_text, currentPage: @filtered_videos.current_page, totalPages: @filtered_videos.total_pages}
  end
end

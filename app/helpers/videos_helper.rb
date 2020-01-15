module VideosHelper

  def getChannels()
    channel_1 = 'UC9YvlExCwL2gh9H8bE63aDA'  # Chief Obi
    channel_2 = 'UCY1ZateUFcH6K-UyM3J4PoA' # African Comedians
    channel_3 = 'UCpSy6fz3rORXNrsodFo3mFQ' # Clifford Owosu
    channel_4 = 'UCMJsaAgrrwkPgHLKYGGjYlg' # African Ape
    channel_5 = 'UCTC1SIC5HTcKaLd4eJTmp1w' # Wowo boys
    channel_6 = 'UCwukLrqPe4ywJTe0RWVlBSA' # Craze Clown
    channel_7 = 'UCvO4Ym5LjYTo0uZRfUvtc-w' # AY Comedian
    channel_8 = 'UCwemICO9grnv9xkvFkoRvMA' # Stand up Nigeria
    channel_9 = 'UC26q7KQxr5TnKm-OT25MyyQ' # House of Ajebo 
    channel_10 = 'UCQmZ9BIYOBSkxL-eqqg5z-g' # MarkAngel Comedy 
    channel_11 = 'UCIwUNuYEcZiiJqjU04yN30A' # AyoAjewole Woliagba-YPM 
    channel_12 = 'UC6AIZZlzcP3csZcPgltF22Q' # Josh 2 funny 
    channel_13 = 'UCfvmvOEGw6Nqd6E9qMryE3A' # Lasisi Elenu 
    channel_14 = 'UCdN4aXTrHAtfgbVG9HjBmxQ' # Key & Pele
    channel_15 = 'UCZu6U2qCp66HIYdmzkvodNQ' # Key & Pele
    channel_16 = 'UCQi4BT2PqF2aWdW2JwzCFAQ' # Williams Uchembah
    channel_17 = 'UCE4NfDcKHpZyGhKgNLXISow' # FatBoiz COmedy
    channel_18 = 'UCXl2NOUg0a77CsOot-hvTrQ' # GhenGhen Jokes
    channel_19 = 'UC23qbaOP8uK2_eghO-c-jGg' # Splendid TV
    channel_20 = 'UCO19VNHQMmIkvIVl-z4UwGw' # Samuel Ajibola Tv
    # channel_11 =  'UCCQ-qN-4JcmXe4GcktUsITg' # DC Young Fly
    # channel_12 = 'UC4JoLGDc4qhyP5p6Vgs8qXQ' # Desi Banks
    # channel_13 = 'UCxyCzPY2pjAjrxoSYclpuLg' # Laugh Factory
    # channel_14 = 'UCizXhcdxVu-7bBDEmJ99yRQ' # Pat D lucky
    # channel_15 = 'UCqq3PZwp8Ob8_jN0esCunIw' # just for laughs
    # channel_16 = 'UCtw7q4SyOeoCwM1i_3x8lDg' # Comedy central standup
    # channel_17 = 'UCdN4aXTrHAtfgbVG9HjBmxQ' # key & Pele
    # channel_17 = 'UC2iwgQq9nvW0MkxJn7jI0XQ' # Tyrhee Spivey
    # channel_9 = 'UCg9NadeQbjGL80cDnCf1g-A' # Nollywood skits comedy
    # channel_10 = 'UCSW1uGP-JC2Uir1kR9fFwfA' # Nigeria latest comedy 
    return [channel_1, channel_2, channel_3, channel_4, channel_5, channel_6, channel_7, channel_8, channel_9, channel_10, channel_11, channel_12, channel_13, channel_14, channel_15, channel_16, channel_17, channel_18, channel_19, channel_20]
    # return [channel_10]
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
        # Filter top three channels by date and select if not older by a month
        channel_trends = each_channel.videos.where(order: 'date').map.first(2)
        channel_trends.each {|each_channel_trends|
          if ((Time.current - each_channel_trends.published_at)/1.day).round < 31 
            Trending.create(:url => each_channel_trends.id, :title => each_channel_trends.title.tr('#',''), :date => each_channel_trends.published_at, :meta_data => each_channel_trends.channel_id)
          end
        }
      }
      Video.all.each {|each_video| 
        if ((Time.current - each_video.updated_at)/1.day).round < 14
          Trending.create(:url => each_video.url, :title => each_video.title.tr('#',''), :date => each_video.created_at)
        end
      }
    end
    @trending_videos = Trending.all.shuffle
    return @trending_videos
  end

  def get_all_videos(is_irl)
    if is_irl
      @irl_videos = Video.is_irl().sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 60)
      @trending_videos = get_trending_videos()
      @videos_info = {allVideos: @irl_videos, trendingVideos: @trending_videos, currentPage: @irl_videos.current_page, totalPages: @irl_videos.total_pages}
    else
      channels = getChannels()
      if Youtube.all.blank?
        channels.each {|each_channel_item| 
          each_channel = Yt::Channel.new id: each_channel_item
          if each_channel_item == 'UCg9NadeQbjGL80cDnCf1g-A' || each_channel_item == 'UCSW1uGP-JC2Uir1kR9fFwfA'
            channel_videos = each_channel.videos.map.to_a
            sorted_channel_videos = channel_videos.sort_by{|vid| vid.published_at}
            sorted_channel_videos.each.with_index(1) { |e, i|
              if i == 1 || (i > 1 && e.published_at.to_date != sorted_channel_videos[i - 1].published_at.to_date)
                Youtube.create(:url => e.id, :title => e.title.tr('#',''), :date => e.published_at, :meta_data => e.channel_id)
              end
            }
          else
            each_channel.videos.each { |e| 
              Youtube.create(:url => e.id, :title => e.title.tr('#',''), :date => e.published_at, :meta_data => e.channel_id)}
          end
        }
      end
      @uploaded_videos = Video.has_vimeo_video_id()
      @manual_youtube_videos = Video.is_youtube.not_irl()
      @youtube_videos = Youtube.all
      @all_videos = (@uploaded_videos + @manual_youtube_videos + @youtube_videos).sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 60)
      @trending_videos = get_trending_videos()
      @videos_info = {allVideos: @all_videos, trendingVideos: @trending_videos, currentPage: @all_videos.current_page, totalPages: @all_videos.total_pages}
      return @videos_info
    end
  end

  def get_search_filtered_videos(search_text)
    @filtered_youtube_videos = Youtube.search(search_text)
    @filtered_uploaded_videos = Video.search(search_text)
    @filtered_videos = (@filtered_youtube_videos + @filtered_uploaded_videos).sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 60)
    @videos_info = {searchedVideos: @filtered_videos, searchedText: search_text, currentPage: @filtered_videos.current_page, totalPages: @filtered_videos.total_pages}
  end
end

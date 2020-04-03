module VideosHelper
  include ActionView::Helpers::NumberHelper

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
    channel_21 = 'UCkKHhORmLc14fmYvOa4Y7Ug' # Samuel Ajibola Tv
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
    return [channel_1, channel_2, channel_3, channel_4, channel_5, channel_6, channel_7, channel_8, channel_9, channel_10, channel_11, channel_12, channel_13, channel_14, channel_15, channel_16, channel_17, channel_18, channel_19, channel_20, channel_21]
    # return [channel_1]
    # return [channel_10]
  end

  def add_views_to_model_array(model_array)
    model_array.each { |each_model| 
      each_model.views = each_model.video_views.first[:views]
    }
  end

  def get_related_youtube_videos(meta_data)
    @related_videos = Youtube.includes(:video_views).same_meta_data_as(meta_data)
    add_views_to_model_array(@related_videos)
		return @related_videos
	end

  def get_related_videos(author_email, irl)
    related_uploaded_videos = []
    if irl
      related_uploaded_videos = Video.includes(:video_views).is_irl.order("RANDOM()").limit(10)
    else
      related_uploaded_videos = Video.includes(:video_views).same_author_email(author_email).has_vimeo_video_id
    end
    youtube_videos = Youtube.includes(:video_views).order("RANDOM()").limit(10)
    add_views_to_model_array(related_uploaded_videos)
    add_views_to_model_array(youtube_videos)
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
            @youtube_video = Youtube.includes(:video_views).same_url_as(each_channel_trends.id).first
            @views = @youtube_video.video_views.first[:views]
            Trending.create(:url => each_channel_trends.id, :title => each_channel_trends.title.tr('#',''), :date => each_channel_trends.published_at, :meta_data => each_channel_trends.channel_id, :views => @views)
          end
        }
      }
      Video.includes(:video_views).all.each {|each_video| 
        if ((Time.current - each_video.updated_at)/1.day).round < 14
          Trending.create(:url => each_video.url, :title => each_video.title.tr('#',''), :date => each_video.created_at, :meta_data => each_video.meta_data, :vimeo_video_id => each_video.vimeo_video_id, :is_irl => each_video.is_irl, :accepted => each_video.accepted, :thumb_nail => each_video.thumb_nail, :views => each_video.video_views.first[:views])
        end
      }
    end
    @trending_videos = Trending.all.shuffle
    return @trending_videos
  end

  def get_all_videos(update)
    channels = getChannels()
    if update
      channels.each {|each_channel_item| 
        each_channel = Yt::Channel.new id: each_channel_item
        each_channel.videos.each { |e| 
          if (!Youtube.same_url_as(e.id).first)
            Youtube.create(:url => e.id, :title => e.title.tr('#',''), :date => e.published_at, :meta_data => e.channel_id)
            VideoView.create(:youtube_url => e.id, :views => number_with_delimiter(rand(10000..50000)))
          end
        }
      }
    end
    @other_videos = Video.includes(:video_views).all
    @youtube_videos = Youtube.includes(:video_views).all
    @combined_videos = (@other_videos + @youtube_videos)
    add_views_to_model_array(@combined_videos)
    @all_videos = @combined_videos.sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 60)
    @trending_videos = get_trending_videos()
    @videos_info = {allVideos: @all_videos, trendingVideos: @trending_videos, currentPage: @all_videos.current_page, totalPages: @all_videos.total_pages}
    return @videos_info
  end

  def get_search_filtered_videos(search_text)
    @filtered_youtube_videos = Youtube.includes(:video_views).search(search_text)
    add_views_to_model_array(@filtered_youtube_videos)
    @filtered_uploaded_videos = Video.includes(:video_views).search(search_text)
    add_views_to_model_array(@filtered_uploaded_videos)
    @filtered_videos = (@filtered_youtube_videos + @filtered_uploaded_videos).sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 60)
    @videos_info = {searchedVideos: @filtered_videos, searchedText: search_text, currentPage: @filtered_videos.current_page, totalPages: @filtered_videos.total_pages}
  end
end

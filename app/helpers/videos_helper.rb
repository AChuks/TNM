module VideosHelper
  include ActionView::Helpers::NumberHelper

  def getChannels()
    channel_1 = 'UC9YvlExCwL2gh9H8bE63aDA'  # Chief Obi
    # channel_2 = 'UCY1ZateUFcH6K-UyM3J4PoA' # African Comedians
    channel_2 = 'UCpSy6fz3rORXNrsodFo3mFQ' # Clifford Owosu
    channel_3 = 'UCMJsaAgrrwkPgHLKYGGjYlg' # African Ape
    channel_4 = 'UCTC1SIC5HTcKaLd4eJTmp1w' # Wowo boys
    channel_5 = 'UCwukLrqPe4ywJTe0RWVlBSA' # Craze Clown
    channel_6 = 'UCvO4Ym5LjYTo0uZRfUvtc-w' # AY Comedian
    # channel_8 = 'UCwemICO9grnv9xkvFkoRvMA' # Stand up Nigeria
    channel_7 = 'UC26q7KQxr5TnKm-OT25MyyQ' # House of Ajebo 
    channel_8 = 'UCQmZ9BIYOBSkxL-eqqg5z-g' # MarkAngel Comedy 
    channel_9 = 'UCIwUNuYEcZiiJqjU04yN30A' # AyoAjewole Woliagba-YPM 
    channel_10 = 'UC6AIZZlzcP3csZcPgltF22Q' # Josh 2 funny 
    channel_11 = 'UCfvmvOEGw6Nqd6E9qMryE3A' # Lasisi Elenu 
    # channel_14 = 'UCdN4aXTrHAtfgbVG9HjBmxQ' # Key & Pele
    channel_12 = 'UCZu6U2qCp66HIYdmzkvodNQ' # Z Fancy
    channel_13 = 'UCQi4BT2PqF2aWdW2JwzCFAQ' # Williams Uchembah
    channel_14 = 'UCE4NfDcKHpZyGhKgNLXISow' # FatBoiz COmedy
    channel_15 = 'UCXl2NOUg0a77CsOot-hvTrQ' # GhenGhen Jokes
    channel_16 = 'UC23qbaOP8uK2_eghO-c-jGg' # Splendid TV
    channel_17 = 'UCO19VNHQMmIkvIVl-z4UwGw' # Samuel Ajibola Tv
    channel_18 = 'UCkKHhORmLc14fmYvOa4Y7Ug' # Samuel Ajibola Tv
    channel_19 = 'UCpn6YbS5VrcuB0yMDNii2Kw' # TriadsNG
    channel_20 = 'UCjSzBGfo9gDXP0OerKJ9GZg' # Twyse Ereme
    channel_21 = 'UCEL7Wa72HieEzSAucyxBdDg' # Manny Nation
    channel_22 = 'UCLgTL2bGK0VIY2iYJjD5NpA' # Ikorodu boys
    channel_23 = 'UCKrjM68uzaA3llVdm1MrR-Q' # Kems Mama
    channel_24 = 'UCxAkiUiL3KnMl0BIFBv6xxA' # Mr Macaroni
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
    return [channel_1, channel_2, channel_3, channel_4, channel_5, channel_6, channel_7, channel_8, channel_9, channel_10, channel_11, channel_12, channel_13, channel_14, channel_15, channel_16, channel_17, channel_18, channel_19, channel_20, channel_21, channel_22, channel_23, channel_24]
    # return [channel_1]
    # return [channel_10]
  end

  def getTwitterhandles()
    handle_1 = "instablog9ja"
    handle_2 = "FunnyAfrica"
    handle_3 = "yabaleftonline"
    handle_4 = "GistReel"
    return [handle_1, handle_2, handle_3, handle_4]
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
      channels.each { |each_channel_item|
        each_channel= Yt::Channel.new id: each_channel_item
        # Filter top three channels by date and select if not older by a month
        channel_trends = each_channel.videos.where(order: 'date').map.first(2)
        channel_trends.each {|each_channel_trends|
          if ((Time.current - each_channel_trends.published_at)/1.day).round < 31 
            @youtube_video = Youtube.includes(:video_views).same_url_as(each_channel_trends.id)
            puts each_channel_trends.id
            @views =  !@youtube_video.first.nil? ? @youtube_video.first.video_views.first[:views] : @youtube_video.video_views.first[:views]
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
            VideoView.create(:youtube_url => e.id, :views => number_with_delimiter(rand(2000..20000)))
          end
        }
      }
    end
    @other_videos = Rails.cache.fetch('videos', expires_in: 1.day) do
      Video.includes(:video_views).where(is_irl: true).or(Video.includes(:video_views).where(accepted: true))
    end
    @youtube_videos = Rails.cache.fetch('youtubes', expires_in: 1.day) do
      Youtube.includes(:video_views).all
    end
    @all_videos = Rails.cache.fetch('all_videos', expires_in: 1.day) do
      get_combined_videos(@other_videos, @youtube_videos)
    end
    @all_videos = @all_videos.reverse.paginate(page: params[:page],:per_page => 60)
    @trending_videos = Rails.cache.fetch('trendings', expires_in: 1.day) do
      get_trending_videos()
    end
    @videos_info = {allVideos: @all_videos, trendingVideos: @trending_videos, currentPage: @all_videos.current_page, totalPages: @all_videos.total_pages}
    return @videos_info
  end

  def get_combined_videos(other_videos, youtube_videos)
    @combined_videos = (other_videos + youtube_videos).sort_by(&:date)
    add_views_to_model_array(@combined_videos)
    return @combined_videos
  end

  def get_search_filtered_videos(search_text)
    @filtered_youtube_videos = Youtube.includes(:video_views).search(search_text)
    add_views_to_model_array(@filtered_youtube_videos)
    @filtered_uploaded_videos = Video.includes(:video_views).search(search_text)
    add_views_to_model_array(@filtered_uploaded_videos)
    @filtered_videos = (@filtered_youtube_videos + @filtered_uploaded_videos).sort_by(&:date).reverse.paginate(page: params[:page],:per_page => 60)
    @videos_info = {searchedVideos: @filtered_videos, searchedText: search_text, currentPage: @filtered_videos.current_page, totalPages: @filtered_videos.total_pages}
  end

  def fetch_tweets
    twitter_handles = getTwitterhandles();
    twitter_handles.each {|each_twitter_handle|
      each_handle_tweets = TwitterClient.user_timeline(each_twitter_handle, count: 200, exclude_replies: true)
      each_handle_tweets.each {|each_tweet|
        if each_tweet.media?
          each_tweet_media = each_tweet.media[0]
          if each_tweet_media && each_tweet_media.type == "video"
            video_variants = each_tweet_media.video_info.variants
            video_variants_length = video_variants.length
            desired_video_index = video_variants_length - 2;
            if desired_video_index < 0
              desired_video_index = 0
            end
            desired_video = video_variants[desired_video_index];
            if (!Video.same_url_as(desired_video.url.to_s).first)
              @video = Video.new(:url => desired_video.url.to_s, :thumb_nail => each_tweet_media.media_url_https.to_s, :title => each_tweet.text.to_s, :description => each_tweet.text.to_s, :date => each_tweet.created_at, :author => 'Abe Chuk', :author_email => 'abechuk@gmail.com', :agreed_to_vid_sub_policy => true, :is_twitter => true)
              if @video.save
                VideoView.create(:video_url => @video.url, :video_id => @video.id, :views => number_with_delimiter(rand(1000..10000)))
              end
            end
          end
        end
      }
    }
  end
end

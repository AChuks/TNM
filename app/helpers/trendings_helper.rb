module TrendingsHelper
	# Populate Trending videos
	def get_trending_videos()
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

    	all_channel = [channel_1, channel_2, channel_3, channel_4, channel_5, channel_6, channel_7, channel_8, channel_9, channel_10]

    	if Trending.all.blank?
      		all_channel.each {|each_channel| 
                each_channel= Yt::Channel.new url: each_channel
                channel_trends = each_channel.videos.where(order: 'date').map.first(2)
                channel_trends.each {|each_channel_trends| 
                    Trending.create(:url => each_channel_trends.id, :title => each_channel_trends.title.tr('#',''), :date => each_channel_trends.published_at, :meta_data => each_channel_trends.channel_id) }
                }

    	end
    	@trending_videos = Trending.all.shuffle
    	return @trending_videos
	end
end

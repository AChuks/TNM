module YoutubesHelper
	# Populate Youtube videos
	def get_youtube_videos()
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

    	if Youtube.all.blank?
      		all_channel.each {|each_channel| each_channel = Yt::Channel.new url: each_channel
      		each_channel.videos.map { |e| Youtube.create(:url => e.id, :title => e.title, :date => e.published_at, :meta_data => e.channel_id) }}
    	end
    	@youtube_videos = Youtube.paginate(page: params[:page],:per_page => 60).order('date DESC')
    	return @youtube_videos
	end
end

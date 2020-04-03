class VideoView < ActiveRecord::Base
    belongs_to :youtube, :foreign_key => 'youtube_url', :primary_key => 'url'
    belongs_to :video, :foreign_key => 'video_url', :primary_key => 'url'
    scope :same_youtube_url_as, -> (url) {where youtube_url: url}
    scope :same_video_url_as, -> (url) {where video_url: url}
end

class Youtube < ActiveRecord::Base
  include PgSearch::Model
	scope :same_meta_data_as, -> (meta_data) {where meta_data: meta_data}
  scope :same_url_as, -> (url) {where url: url}
  pg_search_scope :search, against: [:title]
end

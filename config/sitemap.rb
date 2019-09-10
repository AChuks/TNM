# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.supercomedian.com"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(fog_provider: ENV['FOG_PROVIDER'],aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],fog_directory: ENV['FOG_DIRECTORY'],fog_region: ENV['FOG_REGION'])

SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.ping_search_engines('http://supercomedian.com/sitemap')


SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add root_path, :changefreq => 'daily'
  add '/videos/new', :changefreq => 'weekly'
  add '/contact', :changefreq => 'weekly'
end

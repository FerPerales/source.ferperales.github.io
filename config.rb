require 'lib/anchor'
# helpers MarkdownHelper

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :dotenv
activate :directory_indexes
activate :asset_host, host:  ''
activate :gzip

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = ENV['AWS_BUCKET']
  s3_sync.region                     = 'us-west-1'
  s3_sync.aws_access_key_id          = ENV['AWS_ACCESS_KEY']
  s3_sync.aws_secret_access_key      = ENV['AWS_SECRET']
  s3_sync.delete                     = false
  s3_sync.after_build                = false
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
  s3_sync.version_bucket             = false
  s3_sync.index_document             = 'index.html'
end
caching_policy 'text/html', max_age: 0, must_revalidate: true
default_caching_policy max_age: (60 * 60 * 24 * 365)

activate :deploy do |deploy|
  deploy.deploy_method       = :rsync
  deploy.host                = "#{ENV['SERVER_USER']}@#{ENV['SERVER_HOST']}"
  deploy.path                = ENV['SERVER_PATH']
  deploy.user                = ENV['SERVER_USER']
  deploy.clean               = true
end

set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    renderer: GithubStyleTitles

page '/404.html', directory_index: false

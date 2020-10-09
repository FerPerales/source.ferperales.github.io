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

set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    renderer: GithubStyleTitles

page '/404.html', directory_index: false

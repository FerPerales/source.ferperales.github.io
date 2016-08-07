page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :dotenv
activate :directory_indexes

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

activate :cloudfront do |cf|
  cf.access_key_id = 'I'
  cf.secret_access_key = 'love'
  cf.distribution_id = 'cats'
  # cf.after_build = false  # default is false
end

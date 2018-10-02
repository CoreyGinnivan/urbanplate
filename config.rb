
###
# Page options, layouts, aliases and proxies
###


# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###



activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.permalink = "recipe/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "recipe"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".html.md"
  blog.new_article_template = File.expand_path('recipe_meta.erb', File.dirname(__FILE__))

  blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"
  blog.sources = "recipes/:title.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

activate :ogp do |ogp|
  #
  # register namespace with default options
  #
  ogp.namespaces = {
    og: data.ogp.og,
    # from data/ogp/og.yml
    twitter: data.ogp.twitter
    # from data/ogp/twitter.yml
  }
  ogp.base_url = 'https://urbanplate.co'
  ogp.blog = true
end

page "/feed.xml", layout: false

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

activate :sprockets

after_configuration do
  sprockets.append_path "source/stylesheets/"
  sprockets.append_path "node_modules"
end

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes
page "/404.html", :directory_index => false

activate :aria_current

# Methods defined in the helpers block are available in templates
# helpers do

# end

# Build-specific configuration
configure :build do
    activate :asset_hash, :ignore => %r{^images/.*}
    activate :minify_javascript
    activate :minify_css
    activate :gzip
end



configure do
  config.sass.preferred_syntax = :sass
  config.sass.line_comments = false
  config.sass.cache = false
end


def darken_color(hex_color, amount=0.4)
  rgb = hex_color.scan(/../).map {|color| color.hex}
  rgb[0] = (rgb[0].to_i * amount).round
  rgb[1] = (rgb[1].to_i * amount).round
  rgb[2] = (rgb[2].to_i * amount).round
  "#%02x%02x%02x" % rgb
end

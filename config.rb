### 
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
compass_config do |config|
  config.http_path = "/"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"
  config.output_style = :compact
end
###
# Haml
###

# CodeRay syntax highlighting in Haml
# First: gem install haml-coderay
# require 'haml-coderay'

# CoffeeScript filters in Haml
# First: gem install coffee-filter
# require 'coffee-filter'

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

###
# Page command
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def header_navigation_item(path)
    content_tag(:li) do
      link_to("#{path.capitalize}", "/#{path}/", :class => active_nav?("/#{path}/"))
    end
  end

  def active_nav?(path)
    (path == current_page.url) ? "active" : nil
  end

  def homepage?
    section = current_page.url.gsub(/[^a-zA-Z 0-9]/, "")
    (current_page.url == "/") ? nil : "detail"
  end

  def section
    section = current_page.url.gsub(/[^a-zA-Z 0-9]/, "")
    (current_page.url == "/") ? nil : "section-indicators-#{section}"
  end

  def article
    article = current_page.url.gsub(/[^a-zA-Z 0-9]/, "")
    (current_page.url == "/") ? nil : "landing-" << article
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # # Compress PNGs after build
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"

  activate :deploy do |deploy|
    deploy.method = :ftp
    deploy.host = "ftp.example.com"
    deploy.user = "tvaughan"
    deploy.password = "secret"
    deploy.path = "/srv/www/site"
  end
end

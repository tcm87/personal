
data.projects.each do |project|
  proxy "/projects/#{project[0].split('-')[1]}.html", "/projects/template.html", :locals => {project: project[1], short_name: project[0].split('-')[1]}, :ignore => true
end

data.digital.each do |project|
  proxy "/projects/#{project[0].split('-')[1]}.html", "/projects/template.html", :locals => {project: project[1], short_name: project[0].split('-')[1]}, :ignore => true
end

data.essays.each do |essay|
  proxy "/essays/#{essay[0].split('-')[1]}.html", "/essays/template.html", :locals => {essay: essay[1], short_name: essay[0].split('-')[1]}, :ignore => true
end

data.stories.each do |essay|
  proxy "/essays/#{essay[0].split('-')[1]}.html", "/essays/template.html", :locals => {essay: essay[1], short_name: essay[0].split('-')[1]}, :ignore => true
end

configure :development do
  activate :livereload
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

sprockets.append_path File.join root, 'bower_components'

activate :directory_indexes

# Build-specific configuration
configure :build do
  set :https, true

  set :relative_links, true

  activate :minify_css

  activate :minify_javascript

  activate :asset_hash do |opts|
    opts.ignore << 'favicon/*'
  end

  activate :relative_assets

  # activate :autoprefixer do |config|
  #   config.browsers = ['last 2 versions', 'Explorer >= 9']
  # end

  # activate :imageoptim
end

# To deploy to a remote branch via git (e.g. gh-pages on github):
#activate :deploy do |deploy|
  #  deploy.method = :git
    # remote is optional (default is "origin")
    # run `git remote -v` to see a list of possible remotes
   # deploy.remote = "some-other-remote-name"
    
    # branch is optional (default is "gh-pages")
    # run `git branch -a` to see a list of possible branches
    #deploy.branch = "some-other-branch-name"
    
    # strategy is optional (default is :force_push)
   # deploy.strategy = :submodule
#end

inside('vendor') do
  run "ln -s ~/code/rails/rails_trunk rails"
end

git :init

file '.gitignore', <<-CODE
log/*.log
log/*.pid
db/*.db
db/*.sqlite3
db/schema.rb
tmp/**/*
.DS_Store
doc/api
doc/app
config/database.yml
CODE

run "cp config/database.yml config/example_database.yml"

git :add => ".", :commit => "-a -m 'Initial Commit'"

gem "thoughtbot-shoulda", :lib => "shoulda", :source => "http://gems.github.com"
gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com"

gem 'cucumber'
generate("cucumber")

git :add => ".", :commit => "-a -m 'Added cucumber'"

gem 'haml'
run "haml --rails ."

git :add => ".", :commit => "-a -m 'Added haml'"


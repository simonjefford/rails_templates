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

if yes?("Use rspec?")
  plugin 'rspec', :git => 'git://github.com/dchelimsky/rspec.git'
  plugin 'rspec-rails', :git => 'git://github.com/dchelimsky/rspec-rails.git'
  generate("rspec")

  git :add => ".", :commit => "-a -m 'Added rspec'"
end

generate("cucumber")

git :add => ".", :commit => "-a -m 'Added cucumber'"

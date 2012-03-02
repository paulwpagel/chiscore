source 'http://rubygems.org'

gem 'rails', '3.0.1'

gem "haml"
gem "authlogic"
gem "rails3-generators"
gem "capistrano"

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails', '>= 2.0.0.beta.22'
  gem 'fuubar' # shows bar graph during tests
  gem 'timecop'
end

source 'https://rubygems.org'

gem "bundler"
gem "hpricot"
gem 'color'
#gem "mail"
#gem "needle"
#gem "odba"
#gem "rake"
#gem "rclconf"
#gem "sbsm"
#gem 'deprecated', '= 2.0.1'
gem 'transaction-simple'
group :test do
  gem "flexmock"
  gem "test-unit"
  gem "rake"
  gem "rspec"
end
group :debugger do
        if RUBY_VERSION.match(/^1/)
                gem 'pry-debugger'
        else
                gem 'pry-byebug'
    gem 'pry-doc'
        end
end


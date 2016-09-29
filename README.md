# LoomioScraper

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/LoomioScraper`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

On your macine must be install phantomjs:
```
sudo apt-get install phantomjs
```

Add this line to your application's Gemfile:

```ruby
gem 'LoomioScraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install LoomioScraper

## Usage

You can parse Loomio Activity 
```ruby 
> activity = LoomioScraper::Activity.new("https://www.loomio.org/d/gEZ5NO1W")
#=> page load finished
#=> #<LoomioScraper::Activity:0x00000001413a88..
> comments = activity.comments
#=> [{:id=>"1128958", :link=>"/u/yegormukha", :author_name=>"Yegor Mukha", :comment=>"Странные выводы дает автор статьи. \"...
> activity.to_hash
#=> {:comments=>[{:id=>"1128958", :link=>"/u/yegormukha", :author_name=>"Yegor Mukha", :comment=>"Странные выводы дает автор статьи. \"...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rockettron/LoomioScraper.


# DuckDuckGoApi

Lightweight, flexible library for the Duck Duck Go API (https://duckduckgo.com/api) in Ruby 

## Installation

Add this line to your application's Gemfile:

    gem 'duck_duck_go_api'

And then execute:

    $ bundle

## Usage

Call the API directly via the DuckDuckGoApi::Client. Pass in parameters such as (q, format, etc..)
Parameters map 1-1 as stated in the documentation https://duckduckgo.com/api

### You'll need the DuckDuckGoApi::Client
	
	client = DuckDuckGoApi::Client

### Query Anything!

	client.query :q => "github", :format => "json"

### Parameters Maps 1-1 in https://duckduckgo.com/api

	client.query :q => "github", :format => "json", :no_html => 1, :skip_disambig => 1

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

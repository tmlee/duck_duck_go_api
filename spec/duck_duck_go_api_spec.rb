require 'spec_helper'
require 'duck_duck_go_api'

describe DuckDuckGoApi do

	before :all do
		@client = DuckDuckGoApi::Client.new
	end

	it "makes basic api call when passed in parameter q and format" do
		stub_get("https://api.duckduckgo.com/?q=github&format=json", 'response.json')
		result = @client.query :q => "github", :format => "json"
		expect(result["Heading"]).to eql("GitHub")
	end

	context "passing parameter no_html" do
		it "returns api response with no_html" do
			stub_get("https://api.duckduckgo.com/?q=github&format=json&no_html=1", 'response.json')
			result = @client.query :q => "github", :format => "json", :no_html => 1
			expect(result["Results"].first["Result"]).to_not eql("<a href=\"https://github.com/\"><b>Official site</b></a><a href=\"https://github.com/\"></a>")
		end	
	end
	
end
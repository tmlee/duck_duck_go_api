require "duck_duck_go_api/version"
require "faraday"
require "json"

module DuckDuckGoApi
  class Client
  	BASE_URL = 'https://api.duckduckgo.com'
	
  	class << self
  		def query(options={})
  			api_call '', options
  		end
		
			############## Private API Call Method ##############
  		private
		
			def api_url
				BASE_URL + '/'
			end
		
			def api_call(method_name, options, verb=:get)
				response = connection(method_name, options, verb)
				parse_response response
			end
		
			def parse_response(response)
				raise_errors response
				if response.body == " "
					{}
				else
					JSON.parse response.body
				end
			end
		
			def connection(method_name, options, verb)
		
				conn = Faraday.new(:url => api_url) do |faraday|
					faraday.request  :url_encoded
					faraday.adapter  Faraday.default_adapter
				end
				response = conn.get(method_name + "?" + to_query_params(options))
			end
		
		
			def to_query_params(options)
				options.collect { |key, value| "#{key}=#{value}" }.join('&')
			end
		
			def raise_errors(response)
				message = "(#{response.status})"
				
				case response.status.to_i
				  when 400
				    raise BadRequest, message
				  when 401
				    raise Unauthorized, message
				  when 403
				    raise General, message
				  when 404
				    raise NotFound, message
				  when 500
				    raise InternalError, "An internal error is thrown."
				  when 502..503
				    raise Unavailable, message
				end
			end

		end

	end

	class BadRequest < StandardError; end
  class Unauthorized      < StandardError; end
  class General           < StandardError; end
  class Unavailable       < StandardError; end
  class InternalError     < StandardError; end
  class NotFound          < StandardError; end

end

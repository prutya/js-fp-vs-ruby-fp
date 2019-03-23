require 'net/https'
require 'uri'
require 'json'

get_from_api = ->(base_url) {
  ->(endpoint) {
    ->(callback) {
      begin
        uri_str = "#{base_url}#{endpoint}"
        uri = URI.parse(uri_str)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)

        callback.call(JSON.parse(response.body))
      rescue StandardError => e
        puts e.message
      end
    }
  }
}

get_github = get_from_api.('https://api.github.com')

get_github_users = get_github.('/users')
get_github_repos = get_github.('/repositories')

prop = ->(key) { ->(hash) { hash[key] } }

prop_login      = prop.('login')
prop_avatar_url = prop.('avatar_url')

puts get_github_users.(->(data) { data.map(&prop_login) })
puts get_github_users.(->(data) { data.map(&prop_avatar_url) })

# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

class Hacker
  class << self
    def hack(email, password)
    # BEGIN
    hostname = 'https://rails-collective-blog-ru.hexlet.app'
    uri = URI(hostname)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new URI.join(hostname, '/users/sign_up')
    response = http.request request

    cookie = response.response['set-cookie'].split('; ')[0]

    html = Nokogiri::HTML(response.body)
    token_tag = html.at('input[@name="authenticity_token"]')
    csrf_token = token_tag.attributes['value'].value

    params = {
      'email': email,
      'password': password,
      'token': csrf_token
    }

    post_request = Net::HTTP::Post.new URI.join(hostname, '/users')
    post_request.body = URI.encode_www_form(params)
    post_request['Cookie'] = cookie

    request = http.request post_request
    request.status
    end
    # END
  end
end

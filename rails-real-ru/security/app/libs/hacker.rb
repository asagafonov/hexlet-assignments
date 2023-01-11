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
    csrf_token = html.at('input[@name="authenticity_token"]')['value']

    params = {
      'user[email]': email,
      'user[password]': password,
      'user[password_confirmation]': password,
      'authenticity_token': csrf_token
    }

    post_request = Net::HTTP::Post.new URI.join(hostname, '/users')
    post_request.body = URI.encode_www_form(params)
    post_request['Cookie'] = cookie

    response = http.request post_request
    response.code == '302'
    end
    # END
  end
end

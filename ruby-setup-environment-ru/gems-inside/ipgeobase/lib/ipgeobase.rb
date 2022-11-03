# frozen_string_literal: true

require "bundler"
require_relative "ipgeobase/version"
Bundler.require(:default)

module Ipgeobase
  class Error < StandardError; end

  attr_reader :default_url, :template

  def initialize
    @default_url = "http://ip-api.com/xml/"
    @template = Addressable::Template.new("#{default_url}{#ip}")
  end

  def lookup(ip)
    url = template.expand({ "ip" => ip })
    response = Net::HTTP.get_response(url)
    HappyMapper.parse(response.body)
  end
end

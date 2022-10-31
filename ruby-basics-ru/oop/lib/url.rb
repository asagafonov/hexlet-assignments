# frozen_string_literal: true

require 'uri'
require 'forwardable'

# BEGIN
class Url
  attr_reader :url, :uri_url

  include Comparable
  extend Forwardable
  def_delegator :uri_url, :scheme, :scheme
  def_delegator :uri_url, :host, :host

  def initialize(url)
    @url = url
    @uri_url = URI(url)
  end

  def query_params
    query = uri_url.query
    return {} unless query

    query
      .split('&')
      .to_h { |p| p.split('=') }
      .transform_keys(&:to_sym)
  end

  def query_param(key, val = nil)
    params = query_params
    params.key?(key) ? params[key] : val
  end

  def <=>(other)
    url <=> other.url
  end
end
# END

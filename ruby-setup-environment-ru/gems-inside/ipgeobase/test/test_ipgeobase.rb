# frozen_string_literal: true

require "bundler"
require "test_helper"
require_relative "../lib/ipgeobase"

Bundler.require(:default, :test)
SimpleCov.start

class TestIpgeobase < Minitest::Test
  attr_reader :test_meta_data

  def setup
    @test_meta_data = {
      city: "Ashburn",
      country: "United States",
      countryCode: "US",
      lat: 39.03,
      lon: -77.5
    }
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_response_contains_attributes
    meta_data = stub_request(:get, "8.8.8.8").to_return(
      body: {
        city: "Ashburn",
        country: "United States",
        countryCode: "US",
        lat: 39.03,
        lon: -77.5
      }
    )
    assert_equal(meta_data, test_meta_data)
  end
end

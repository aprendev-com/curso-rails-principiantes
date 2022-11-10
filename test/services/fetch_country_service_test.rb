require "test_helper"

class FetchCountryServiceTest < ActiveSupport::TestCase
  test "it should return ca with a valid ip" do
    stub_request(:get, "http://ip-api.com/json/24.48.0.1").
      to_return(status: 200, body: {
        status: "success",
        countryCode: "CA"
      }.to_json, headers: {})
    assert_equal(FetchCountryService.new("24.48.0.1").perform, "ca")
  end

  test "it should return nil with an invalid ip" do
    stub_request(:get, "http://ip-api.com/json/fakeip").
      to_return(status: 200, body: {
        status: "fail"
      }.to_json, headers: {})
    assert_nil(FetchCountryService.new("fakeip").perform)
  end
end
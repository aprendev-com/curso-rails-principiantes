require "test_helper"

class FetchCountryJobTest < ActiveJob::TestCase
  test "enqueue correctly" do
    assert_enqueued_jobs 0
    FetchCountryJob.perform_later('1', '0.0.0.0')
    assert_enqueued_jobs 1
  end
end

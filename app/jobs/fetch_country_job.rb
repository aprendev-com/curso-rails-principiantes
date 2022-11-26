class FetchCountryJob < ApplicationJob
  queue_as :default

  def perform(user_id, ip)
    country = FetchCountryService.new(ip).perform
    if country
      user = User.find(user_id)
      user.update(country: country)
    end
  end
end

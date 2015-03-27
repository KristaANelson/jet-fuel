class Url < ActiveRecord::Base
  before_validation :shorten_url
  validates :full_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true

  def shorten_url
    self.short_url = Time.new.strftime("%H%M%S")
  end
end

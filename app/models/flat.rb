require 'uri'

class Flat < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price_per_night, presence: true, numericality: { only_integer: true }
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  validates :picture_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
end

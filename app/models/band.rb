class Band < ApplicationRecord
  has_many :band_time_tables, dependent: :destroy
  has_many :time_tables, through: :band_time_tables
end
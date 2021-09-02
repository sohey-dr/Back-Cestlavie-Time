class TimeTable < ApplicationRecord
  belongs_to :live
  has_many :band_time_tables, dependent: :destroy
  has_many :bands, through: :band_time_tables
end
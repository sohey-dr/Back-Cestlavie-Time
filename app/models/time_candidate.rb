class TimeCandidate < ApplicationRecord
  belongs_to :band
  belongs_to :time_table
end
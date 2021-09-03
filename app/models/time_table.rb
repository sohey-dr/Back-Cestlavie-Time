class TimeTable < ApplicationRecord
  belongs_to :live
  has_many :time_candidates, dependent: :destroy
  has_many :bands, through: :time_candidates
end
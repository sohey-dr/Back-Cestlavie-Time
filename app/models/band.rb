class Band < ApplicationRecord
  has_many :time_candidates, dependent: :destroy
  has_many :time_tables, through: :time_candidates
end

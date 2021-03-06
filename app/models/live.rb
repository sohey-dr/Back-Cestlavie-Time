class Live < ApplicationRecord
  has_many :time_tables, dependent: :destroy
  enum live_type: {
    welcome: 0,
    freshman_debut: 1,
    summer: 2,
    admin_change: 3,
    christmas: 4,
    graduation: 5
  }
end
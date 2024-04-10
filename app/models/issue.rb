class Issue < ApplicationRecord
    belongs_to :group
    has_many :tags
  end
  
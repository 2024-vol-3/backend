class Issue < ApplicationRecord
    before_create :set_uuid
  
    private
    def set_uuid
      self.issue_id = SecureRandom.uuid
    end
  end
  
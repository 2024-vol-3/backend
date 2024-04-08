class Group < ApplicationRecord
    before_create :set_uuid

    private
    def set_uuid
      self.group_id = SecureRandom.uuid
end

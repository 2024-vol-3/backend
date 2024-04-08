class Tag < ApplicationRecord
   
    before_create :set_uuid
    private
    def set_uuid
      self.tag_id = SecureRandom.uuid
end

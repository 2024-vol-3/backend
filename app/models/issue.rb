class Issue < ApplicationRecord
    belongs_to :group
    has_many :tags
    after_commit :create_tag, on: :create


    private
    def create_tag
      tags.new(tag_count:5)
    end
end
  
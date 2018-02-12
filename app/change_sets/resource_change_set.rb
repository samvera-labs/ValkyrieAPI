# frozen_string_literal: true

# Represents a set of changes to a resource
class ResourceChangeSet < Valkyrie::ChangeSet
  self.fields = %i[title author]
  validates :title, presence: true
  property :title, multiple: false, required: true
end

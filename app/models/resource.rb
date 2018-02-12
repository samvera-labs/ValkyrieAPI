# frozen_string_literal: true

# A persisted resource
class Resource < Valkyrie::Resource
  include Valkyrie::Resource::AccessControls
  attribute :id, Valkyrie::Types::ID.optional
  attribute :title, Valkyrie::Types::Set
  attribute :author, Valkyrie::Types::Set
  attribute :member_ids, Valkyrie::Types::Array
end

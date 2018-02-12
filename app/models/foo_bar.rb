# frozen_string_literal: true
# Generated with `rails generate valkyrie:model FooBar`
class FooBar < Valkyrie::Resource
  include Valkyrie::Resource::AccessControls
  attribute :id, Valkyrie::Types::ID.optional
  attribute :title, Valkyrie::Types::Set
  attribute :member_ids, Valkyrie::Types::Array
end

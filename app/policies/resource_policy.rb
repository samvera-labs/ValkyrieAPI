# frozen_string_literal: true

# A authorization policy for Resource models
class ResourcePolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end
end

# frozen_string_literal: true
# Generated with `rails generate valkyrie:model FooBar`
require 'rails_helper'
require 'valkyrie/specs/shared_specs'

RSpec.describe FooBar do
  let(:model_klass) { described_class }
  it_behaves_like "a Valkyrie::Resource"

  it "has tests" do
    skip "Add your tests here"
  end
end
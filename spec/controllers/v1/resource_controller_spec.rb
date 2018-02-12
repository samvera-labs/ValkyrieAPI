# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::ResourcesController do
  let(:persister) { Valkyrie.config.metadata_adapter.persister }

  describe '#show' do
    let!(:resource) { persister.save(resource: Resource.new) }

    it 'is successful' do
      get :show, params: { id: resource.id.to_s }
      expect(response).to be_successful
    end
  end

  describe '#create' do
    it 'is successful' do
      get :create, params: { title: 'Wealth of Nations' }
      expect(response).to be_successful
    end
  end
end

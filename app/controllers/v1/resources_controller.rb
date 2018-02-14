# frozen_string_literal: true

module V1
  # Provides the API /v1/resources endpoint
  class ResourcesController < ApplicationController
    def show
      load_and_authorize_resource
      render json: @resource.to_json
    end

    def create
      resource = Resource.new
      authorize resource
      change_set = ResourceChangeSet.new(resource)
      if change_set.validate(resource_params)
        change_set.sync
        resource = persister.save(resource: resource)
        after_create_success(query_service.find_by(id: resource.id), change_set)
      else
        after_create_error(resource, change_set)
      end
    end

    private

    def after_create_success(resource, _change_set)
      resource.member_ids = ['123', '456']
      json_string = ResourceSerializer.new(resource).serialized_json
      render json: json_string
    end

    def after_create_error(_resource, _change_set)
      render json: { error: 'There was a problem' }
    end

    def metadata_adapter
      Valkyrie.config.metadata_adapter
    end

    delegate :query_service, :persister, to: :metadata_adapter

    def load_and_authorize_resource
      @resource ||= query_service.find_by(id: Valkyrie::ID.new(params[:id]))
      authorize @resource
    end

    def resource_params
      { title: params[:title] }
    end

    def change_set_persister
      Valkyrie::ChangeSetPersister.new(
        metadata_adapter: metadata_adapter,
        storage_adapter: Valkyrie.config.storage_adapter
      )
    end
  end
end

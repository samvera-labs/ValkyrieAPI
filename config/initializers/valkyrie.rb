# frozen_string_literal: true

require 'valkyrie'

# TODO: move to the host app?
# rubocop:disable Metrics/BlockLength
Rails.application.config.to_prepare do
  Valkyrie::MetadataAdapter.register(
    Valkyrie::Persistence::Postgres::MetadataAdapter.new,
    :postgres
  )

  Valkyrie::MetadataAdapter.register(
    Valkyrie::Persistence::Memory::MetadataAdapter.new,
    :memory
  )

  # Valkyrie::MetadataAdapter.register(
  #   Valkyrie::Persistence::Solr::MetadataAdapter.new(
  #     connection: Blacklight.default_index.connection,
  #     resource_indexer: Valkyrie::Persistence::Solr::CompositeIndexer.new(
  #       Valkyrie::Indexers::AccessControlsIndexer,
  #     )
  #   ),
  #   :index_solr
  # )

  # Valkyrie::StorageAdapter.register(
  #   Valkyrie::Storage::Fedora.new(
  #     connection: ActiveFedora.fedora.connection
  #   ),
  #   :fedora
  # )

  # Valkyrie::StorageAdapter.register(
  #   Valkyrie::Storage::Disk.new(base_path: Rails.root.join("tmp", "files")),
  #   :disk
  # )
  #
  # Valkyrie::StorageAdapter.register(
  #   Valkyrie::Storage::Memory.new,
  #   :memory
  # )
  #
  # Valkyrie::MetadataAdapter.register(
  #   Hyrax::IndexingAdapter.new(
  #     metadata_adapter: Valkyrie.config.metadata_adapter,
  #     index_adapter: Valkyrie::MetadataAdapter.find(:index_solr)
  #   ),
  #   :indexing_persister
  # )

  # ImageDerivativeService needs its own change_set_persister because the
  # derivatives may not be in the primary metadata/file storage.
  # Valkyrie::DerivativeService.services << ImageDerivativeService::Factory.new(
  #   change_set_persister: ChangeSetPersister.new(
  #     metadata_adapter: Valkyrie::MetadataAdapter.find(:indexing_persister),
  #     storage_adapter: Valkyrie.config.storage_adapter
  #   ),
  #   use: [Valkyrie::Vocab::PCDMUse.ThumbnailImage]
  # )

  # Valkyrie::FileCharacterizationService.services << Hyrax::TikaFileCharacterizationService
end
# rubocop:enable Metrics/BlockLength

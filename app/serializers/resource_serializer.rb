class ResourceSerializer
  include FastJsonapi::ObjectSerializer
  set_type :resource
  attributes :title, :author
  has_many :members, record_type: :resource
end

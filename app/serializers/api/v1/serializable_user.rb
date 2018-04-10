module Api
  module V1
    class SerializableUser < JSONAPI::Serializable::Resource
      type 'users'

      attributes :name, :email, :age

      has_many :books, class: SerializableBook
    end
  end
end
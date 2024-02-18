class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :pasword_digest, :email
end

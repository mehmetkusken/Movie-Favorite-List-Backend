class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :genre, :plot, :poster, :rating
end

class ClimbSerializer < ActiveModel::Serializer
  attributes :id, :route, :location, :avgstars, :routetype, :rating, :pitches, :latitude, :longitude, :images
end

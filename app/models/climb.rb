class Climb < ApplicationRecord
  has_many :images
  has_many :users, through: :user_climbs

  def serializable_hash(opts)
    super(opts.merge(only: [:id, :route]))
  end

end

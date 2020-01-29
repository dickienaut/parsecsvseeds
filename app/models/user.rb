class User < ApplicationRecord
  has_many :user_climbs, dependent: :destroy
  has_many :climbs, through: :user_climbs

  has_secure_password # setter for password= && User#authenticate

  validates_presence_of :email
  validates_uniqueness_of :email, :case_sensitive => false

  def serializable_hash(opts)
    super(opts.merge(only: [:id, :email], include: :climbs))
  end
end

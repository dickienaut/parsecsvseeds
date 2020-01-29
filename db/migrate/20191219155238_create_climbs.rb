class CreateClimbs < ActiveRecord::Migration[6.0]
  def change
    create_table :climbs do |t|
      t.string :route
      t.string :location
      t.string :url
      t.string :avgstars
      t.string :yourstars
      t.string :routetype
      t.string :rating
      t.integer :pitches
      t.integer :length
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end

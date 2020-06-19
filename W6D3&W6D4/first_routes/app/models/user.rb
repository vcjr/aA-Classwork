# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :text             not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks, # The artwork this person owns
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :viewer_shares, # User has many viewers that they're sharing their artwork with
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_artworks, # Art work that was shared with this user
        through: :viewer_shares,
        source: :artwork

    has_many :comments,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :likes,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Like
end

# John.viewer_shares => artwork_ids that match up with John's id

# John.shared_artworks => set of artworks John shared
    # inside :viewer_shares, it finds all of the artwork_ids that belong to John and that have been shared with other people
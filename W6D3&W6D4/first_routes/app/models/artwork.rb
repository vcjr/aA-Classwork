# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :text             not null
#  image_url :text             not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id, message: "You must have a unique title"}
    validates :image_url, presence: true
    validates :title, presence: true

    belongs_to :artist, #Artwork belongs to artist_id (<- IS the artist that made art)
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy   #ensures that the associated records are also destroyed

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    # An artwork has many likes 
    # output => <#Like0909323, id=1, likeable_type='artwork', likeable_id='2'>
    has_many :likes, 
        primary_key: :id,
        foreign_key: :likeable_id,
        class_name: :Like,
        as: :likeable

    has_many :likers,
        through: :likes,
        source: :user

end

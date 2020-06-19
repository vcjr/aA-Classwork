# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  artwork_id :integer          not null
#
class Comment < ApplicationRecord
    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork

    has_many :likes, 
        primary_key: :id,
        foreign_key: :likeable_id,
        class_name: :Like,
        as: :likeable

    has_many :likers,
        through: :likes,
        source: :user
end

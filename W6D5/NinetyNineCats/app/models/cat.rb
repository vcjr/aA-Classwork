# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  birth_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    COLORS = [
        "Black",
        "White",
        "Orange",
        "Purple"
    ]

    validates :name, presence: true
    validates :color, presence: true, inclusion: {in: COLORS,
        message: "%{value} is not a valid color"}
    validates :sex, presence: true, inclusion: {in: ["M", "F"]}
    validates :description, presence: true
    validates :birth_date, presence: true

    
end

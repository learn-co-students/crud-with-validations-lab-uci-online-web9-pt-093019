class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with SongValidator
    validates :artist_name, presence: true
end




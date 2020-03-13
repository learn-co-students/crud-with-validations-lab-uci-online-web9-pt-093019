class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with SongValidator
end




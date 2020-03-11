class Song < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    validate :release_not_future, :require_if_released
        def release_not_future
            if release_year.present? && release_year > Date.current.year
                errors.add(:release_year, "can't be in the future")
            end
        end
        def require_if_released
            if released && !release_year
                errors.add(:release_year, "release year is required if song has been released")
            end
        end

end

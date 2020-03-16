class YearValidator < ActiveModel::Validator 

    def validate(record)
        if record.released == true
            if !record.release_year
                record.errors[:missing] << "Missing release year"
            elsif record.release_year > Date.today.year
                record.errors[:year] << "Release year cannot be in future"
            end
        end
    end
end
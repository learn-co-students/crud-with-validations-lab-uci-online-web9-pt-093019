#to do - custom validation 
#Title -C
#cannot be blank and 
#not repeated by the same artist in the same year

#Released - must be true or false

#release year - no 2 same artists in one year
# optional if not released
# cannot be a future year

class SongValidator < ActiveModel::Validator 
    def validate(record)
        song_exists = Song.find_by(title: record.title, release_year: record.release_year, artist_name: record.artist_name)
        if song_exists
            record.errors[:title] << "Song title cannot be repeated by the same artist in the same year."
        end 

        unless record.released.class == TrueClass ||  record.released.class == FalseClass
            record.errors[:released] << "Released must be either True or False"
        end 
        
    end 
end 
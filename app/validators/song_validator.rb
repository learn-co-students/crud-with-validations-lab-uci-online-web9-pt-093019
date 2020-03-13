#to do - custom validation 
#Title 
#cannot be blank and 
#not repeated by the same artist in the same year

#Released - must be true or false

#release year - no 2 same artists in one year
# optional if not released
# cannot be a future year

class SongValidator < ActiveModel::Validator 
    def validate(record)
        # Title Validation
        unless record.title.class == String && record.title.length > 0 
            record.errors[:title] << "Song title cannot be blank"
        end 

        song_exists = Song.find_by(title: record.title, release_year: record.release_year, artist_name: record.artist_name)
        if song_exists
            record.errors[:title] << "Song title cannot be repeated by the same artist in the same year."
        end 

        #Released Validation
        unless record.released.class == TrueClass ||  record.released.class == FalseClass
            record.errors[:released] << "Released must be either True or False"
        end 

        #Release Year Validation
        if record.released == true 
            unless record.release_year.class == Integer
                record.errors[:release_year] << "If the song is released it must have a release year"
            end 

            this_year = Time.new.year 
            if record.release_year && record.release_year > this_year
                record.errors[:release_year] << "The release date of a song cannot be a future year"
            end      
           
            #Artist can only release one song per year
            #artist_already_released_a_song = Song.find_by(release_year: record.release_year, artist_name: record.artist_name)
            #if artist_already_released_a_song
            #    record.errors[:release_year] << "An artist can only release one song per year"
            #end 
        end 
    end 
end 
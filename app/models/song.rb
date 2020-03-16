class Song < ApplicationRecord
    include ActiveModel::Validations

    validates :title, :artist_name, presence: true
    validates_uniqueness_of :title, scope: [:artist_name, :release_year]
    validates :released, inclusion: {in: [true, false]}
    #validates_presence_of :release_year, if: lambda {self.released == true}
    validates_with YearValidator, if: lambda {self.released == true}
    
    
    

    
end

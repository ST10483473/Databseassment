USE ArtGalleryDB;
GO

-- Update an artist's name and surname
UPDATE Artist
SET Name = 'Salvador',
    Surname = 'Dali'
WHERE ArtistID = 3;
GO

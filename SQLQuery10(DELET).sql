USE ArtGalleryDB;
GO

-- Step 4: DELETE an artwork
DELETE FROM Artwork
WHERE ArtworkID = 13
  AND Title = 'Roots'
  AND GenreID = 4;
GO

-- Verify the deletion
SELECT * FROM Artwork;
GO

USE ArtGalleryDB;
GO

-- Step 6: Count artworks per genre
SELECT 
    g.Description AS Genre,
    COUNT(a.ArtworkID) AS NumberOfArtworks
FROM Artwork a
JOIN Genre g ON a.GenreID = g.GenreID
GROUP BY g.Description
ORDER BY g.Description ASC;
GO

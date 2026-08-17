USE ArtGalleryDB;
GO

-- Step 5: Report of Artwork, Artist, and Genre
SELECT 
    a.Title AS ArtworkTitle,
    ar.Name + ' ' + ar.Surname AS ArtistName,
    g.Description AS Genre
FROM Artwork a
JOIN Artist ar ON a.ArtistID = ar.ArtistID
JOIN Genre g ON a.GenreID = g.GenreID
ORDER BY g.Description ASC, a.Title ASC;
GO

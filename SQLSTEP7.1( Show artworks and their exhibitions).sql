USE ArtGalleryDB;
GO

-- Q9: Show artworks and their exhibitions
SELECT 
    a.Title AS ArtworkTitle,
    ar.Name + ' ' + ar.Surname AS ArtistName,
    e.Description AS Exhibition
FROM Entry en
JOIN Artwork a ON en.ArtworkID = a.ArtworkID
JOIN Artist ar ON a.ArtistID = ar.ArtistID
JOIN Exhibition e ON en.ExhibitionID = e.ExhibitionID
ORDER BY e.Description, a.Title;
GO

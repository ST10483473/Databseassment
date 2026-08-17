USE ArtGalleryDB;
GO

SELECT a.Title AS ArtworkTitle,
       ar.Name + ' ' + ar.Surname AS ArtistName
FROM Artwork a
JOIN Artist ar ON a.ArtistID = ar.ArtistID
WHERE a.ArtistID IN (
    SELECT ArtistID
    FROM Artwork
    GROUP BY ArtistID
    HAVING COUNT(ArtworkID) > 2
)
ORDER BY ArtistName, ArtworkTitle;
GO

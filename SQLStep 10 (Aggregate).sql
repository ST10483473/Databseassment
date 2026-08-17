USE ArtGalleryDB;
GO

SELECT 
    a.Title AS ArtworkTitle,
    ar.Name + ' ' + ar.Surname AS ArtistName,
    COUNT(en.ExhibitionID) AS ExhibitionCount
FROM Artwork a
JOIN Artist ar ON a.ArtistID = ar.ArtistID
LEFT JOIN Entry en ON a.ArtworkID = en.ArtworkID
GROUP BY a.Title, ar.Name, ar.Surname
ORDER BY ExhibitionCount DESC, a.Title ASC;
GO

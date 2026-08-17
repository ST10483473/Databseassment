SELECT a.Title AS ArtworkTitle,
       ar.Name + ' ' + ar.Surname AS ArtistName
FROM Artwork a
LEFT JOIN Entry en ON a.ArtworkID = en.ArtworkID
JOIN Artist ar ON a.ArtistID = ar.ArtistID
WHERE en.ExhibitionID IS NULL;

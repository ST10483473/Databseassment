SELECT a.Title AS ArtworkTitle,
       COUNT(en.ExhibitionID) AS ExhibitionCount
FROM Artwork a
JOIN Entry en ON a.ArtworkID = en.ArtworkID
GROUP BY a.Title
HAVING COUNT(en.ExhibitionID) > 1;

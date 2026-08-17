-- ArtGalleryDB Assignment
-- Musiki
-- Q1–Q10 Complete Script

USE ArtGalleryDB;
GO

/* Q1: Create Tables */
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Surname NVARCHAR(50)
);

CREATE TABLE Genre (
    GenreID INT PRIMARY KEY,
    Description NVARCHAR(50)
);

CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY,
    Title NVARCHAR(100),
    ArtistID INT FOREIGN KEY REFERENCES Artist(ArtistID),
    GenreID INT FOREIGN KEY REFERENCES Genre(GenreID)
);

CREATE TABLE Exhibition (
    ExhibitionID INT PRIMARY KEY,
    Description NVARCHAR(100)
);

CREATE TABLE Entry (
    EntryID INT PRIMARY KEY,
    ArtworkID INT FOREIGN KEY REFERENCES Artwork(ArtworkID),
    ExhibitionID INT FOREIGN KEY REFERENCES Exhibition(ExhibitionID)
);
GO

/* Q2: Insert Records */
-- Insert Artists, Genres, Artworks, Exhibitions, Entries
-- (20 artworks including fictional ones)
-- Example:
INSERT INTO Artist VALUES (1, 'Leonardo', 'Da Vinci');
INSERT INTO Genre VALUES (1, 'Renaissance');
-- Continue with your full dataset...
GO

/* Q3: Update Artist */
UPDATE Artist
SET Name = 'Salvador',
    Surname = 'Dali'
WHERE ArtistID = 3;
GO

/* Q4: Delete Artwork */
DELETE FROM Artwork
WHERE ArtworkID = 13
  AND Title = 'Roots'
  AND GenreID = 4;
GO

/* Q5: SELECT Report */
SELECT a.Title AS ArtworkTitle,
       ar.Name + ' ' + ar.Surname AS ArtistName,
       g.Description AS Genre
FROM Artwork a
JOIN Artist ar ON a.ArtistID = ar.ArtistID
JOIN Genre g ON a.GenreID = g.GenreID
ORDER BY g.Description, a.Title;
GO

/* Q6: GROUP BY */
SELECT g.Description AS Genre,
       COUNT(a.ArtworkID) AS NumberOfArtworks
FROM Artwork a
JOIN Genre g ON a.GenreID = g.GenreID
GROUP BY g.Description
ORDER BY g.Description;
GO

/* Q7: HAVING */
SELECT g.Description AS Genre,
       COUNT(a.ArtworkID) AS NumberOfArtworks
FROM Artwork a
JOIN Genre g ON a.GenreID = g.GenreID
GROUP BY g.Description
HAVING COUNT(a.ArtworkID) > 2
ORDER BY g.Description;
GO

/* Q8: Subquery */
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

/* Q9: JOIN with Entry + Exhibition */
SELECT a.Title AS ArtworkTitle,
       ar.Name + ' ' + ar.Surname AS ArtistName,
       e.Description AS Exhibition
FROM Entry en
JOIN Artwork a ON en.ArtworkID = a.ArtworkID
JOIN Artist ar ON a.ArtistID = ar.ArtistID
JOIN Exhibition e ON en.ExhibitionID = e.ExhibitionID
ORDER BY e.Description, a.Title;
GO

/* Q10: Aggregate Exhibition Count */
SELECT a.Title AS ArtworkTitle,
       ar.Name + ' ' + ar.Surname AS ArtistName,
       COUNT(en.ExhibitionID) AS ExhibitionCount
FROM Artwork a
JOIN Artist ar ON a.ArtistID = ar.ArtistID
LEFT JOIN Entry en ON a.ArtworkID = en.ArtworkID
GROUP BY a.Title, ar.Name, ar.Surname
ORDER BY ExhibitionCount DESC, a.Title ASC;
GO

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

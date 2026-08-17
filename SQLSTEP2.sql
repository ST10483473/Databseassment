USE ArtGalleryDB;
GO

CREATE TABLE Artist
(
    ArtistID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Genre
(
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    Description VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Exhibition
(
    ExhibitionID INT PRIMARY KEY IDENTITY(1,1),
    Description VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Artwork
(
    ArtworkID INT PRIMARY KEY IDENTITY(1,1),
    GenreID INT NOT NULL,
    ArtistID INT NOT NULL,
    Title VARCHAR(100) NOT NULL,

    CONSTRAINT FK_Artwork_Genre
        FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),

    CONSTRAINT FK_Artwork_Artist
        FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);
GO

CREATE TABLE Entry
(
    EntryID INT PRIMARY KEY IDENTITY(1,1),
    ArtworkID INT NOT NULL,
    ExhibitionID INT NOT NULL,

    CONSTRAINT FK_Entry_Artwork
        FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID),

    CONSTRAINT FK_Entry_Exhibition
        FOREIGN KEY (ExhibitionID) REFERENCES Exhibition(ExhibitionID)
);
GO
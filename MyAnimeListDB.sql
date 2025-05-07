CREATE DATABASE MyAnimeListDB;

USE MyAnimeListDB;

-- Creating Anime table
CREATE TABLE Anime (
    AnimeID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(250) NOT NULL,
    YearAired YEAR NOT NULL,
    Rating DECIMAL(3, 2) CHECK (Rating >= 0 AND Rating <= 10),
    Episodes INT
);

-- Creating Genre table
CREATE TABLE Genre (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(200) UNIQUE NOT NULL
);

-- Creating AnimeGenre table since it is a many-to-many relationship
CREATE TABLE AnimeGenre(
    AnimeID INT,
    GenreID INT,
    PRIMARY KEY (AnimeID, GenreID),
    FOREIGN KEY (AnimeID) REFERENCES Anime(AnimeID) ON DELETE CASCADE,
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID) ON DELETE CASCADE
);

-- Creating studio table
CREATE TABLE Studio (
    StudioID INT AUTO_INCREMENT PRIMARY KEY,
    StudioName VARCHAR(200) NOT NULL UNIQUE
);

-- Adding StudioID as a foreign key in Anime table
ALTER TABLE Anime
ADD COLUMN StudioID INT,
ADD CONSTRAINT fk_Studio
    FOREIGN KEY (StudioID)
    REFERENCES Studio(StudioID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Creating a User table
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(200) NOT NULL
);

-- Creating Favorites table
CREATE TABLE Favorites (
    UserID INT,
    AnimeID INT,
    PRIMARY KEY (UserID, AnimeID),
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE,
    FOREIGN KEY (AnimeID) REFERENCES Anime(AnimeID) ON DELETE CASCADE
);

-- Insert into Studio table
INSERT INTO Studio (StudioName) VALUES 
('MAPPA'), 
('Ufotable'), 
('Studio Ghibli');

-- Insert into Anime table
INSERT INTO Anime (Title, YearAired, Rating, Episodes, StudioID) VALUES 
('Attack on Titan', 2013, 9.1, 87, 1),
('Demon Slayer', 2019, 8.7, 55, 2),
('Spirited Away', 2001, 8.9, 1, 3);

-- Insert into Genre table
INSERT INTO Genre (GenreName) VALUES 
('Action'),
('Fantasy'),
('Adventure'),
('Drama');

-- Insert into AnimeGenre table
INSERT INTO AnimeGenre (AnimeID, GenreID) VALUES 
(1, 1),  -- Attack on Titan - Action
(1, 4),  -- Attack on Titan - Drama
(2, 1),  -- Demon Slayer - Action
(2, 2),  -- Demon Slayer - Fantasy
(3, 2),  -- Spirited Away - Fantasy
(3, 3);  -- Spirited Away - Adventure

-- Insert into User table
INSERT INTO User (Username, Email, PasswordHash) VALUES 
('animefan123', 'fan123@example.com', 'hashedpassword1'),
('otaku4life', 'otaku@example.com', 'hashedpassword2');

-- Insert into Favorites table
INSERT INTO Favorites (UserID, AnimeID) VALUES 
(1, 1),  -- animefan123 favorites Attack on Titan
(1, 2),  -- animefan123 favorites Demon Slayer
(2, 3);  -- otaku4life favorites Spirited Away
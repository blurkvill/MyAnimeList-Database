# MyAnimeListDB

## Project Description

**MyAnimeListDB** is a structured relational database built using MySQL to store and manage information about anime series, genres, studios, users, and their favorite anime. It is designed to reflect real-world relationships such as:

- Many-to-many relationships between anime and genres.
- One-to-many relationship between studios and anime titles.
- User interactions such as favoriting anime.

The schema supports scalability and future feature integration for anime platforms, review apps, or personal anime libraries.

---

## How to Set Up the Project

To run or set up this project locally:

1. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or CLI).
2. Copy and paste the contents of the `MyAnimeListDB.sql` file into a new SQL script window.
3. Execute the script to:
   - Create the database and tables.
   - Set up relationships and constraints.
   - Populate the database with sample data.

## ERD (Entity Relationship Diagram)

Here is a simplified visual representation of the schema design:

 **ERD Screenshot**:
![MyAnimeList ERD](https://github.com/user-attachments/assets/1cfbf3ae-cf85-4a73-b8c3-f744afc5541c)

## Tables Overview

- **Anime**: Stores anime details like title, year aired, rating, number of episodes, and studio.
- **Genre**: Contains unique genre names.
- **AnimeGenre**: Joins anime and genres (many-to-many).
- **Studio**: Lists animation studios.
- **User**: Stores user credentials.
- **Favorites**: Tracks user-anime favorites (many-to-many).

---

## Sample Users & Favorites

- **animefan123** likes *Attack on Titan* and *Demon Slayer*.
- **otaku4life** likes *Spirited Away*.

---

## Contact

For questions, suggestions, or improvements, feel free to reach out or fork the project!

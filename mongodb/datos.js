// MongoDB — base de datos "cine", colección "peliculas" (24 películas)
use cine
db.createCollection("peliculas")

db.peliculas.insertMany([
  // 2021
  { titulo: "Dune", año: 2021, puntuacion: 9, director: "Denis Villeneuve", genero: "Ciencia ficción", duracion: 155 },
  { titulo: "No Time to Die", año: 2021, puntuacion: 8, director: "Cary Joji Fukunaga", genero: "Acción", duracion: 163 },
  { titulo: "West Side Story", año: 2021, puntuacion: 8, director: "Steven Spielberg", genero: "Musical", duracion: 156 },
  { titulo: "Spider-Man: No Way Home", año: 2021, puntuacion: 9, director: "Jon Watts", genero: "Superhéroes", duracion: 148 },
  { titulo: "The French Dispatch", año: 2021, puntuacion: 7, director: "Wes Anderson", genero: "Comedia", duracion: 107 },
  { titulo: "The Matrix Resurrections", año: 2021, puntuacion: 6, director: "Lana Wachowski", genero: "Ciencia ficción", duracion: 148 },
  // 2022
  { titulo: "Everything Everywhere All at Once", año: 2022, puntuacion: 10, director: "Daniel Kwan", genero: "Aventura", duracion: 139 },
  { titulo: "Top Gun: Maverick", año: 2022, puntuacion: 9, director: "Joseph Kosinski", genero: "Acción", duracion: 130 },
  { titulo: "The Fabelmans", año: 2022, puntuacion: 8, director: "Steven Spielberg", genero: "Drama", duracion: 151 },
  { titulo: "Avatar: The Way of Water", año: 2022, puntuacion: 8, director: "James Cameron", genero: "Ciencia ficción", duracion: 192 },
  { titulo: "Elvis", año: 2022, puntuacion: 8, director: "Baz Luhrmann", genero: "Drama", duracion: 159 },
  { titulo: "The Batman", año: 2022, puntuacion: 7, director: "Matt Reeves", genero: "Superhéroes", duracion: 176 },
  // 2023
  { titulo: "Oppenheimer", año: 2023, puntuacion: 10, director: "Christopher Nolan", genero: "Drama", duracion: 180 },
  { titulo: "Barbie", año: 2023, puntuacion: 7, director: "Greta Gerwig", genero: "Comedia", duracion: 114 },
  { titulo: "John Wick: Chapter 4", año: 2023, puntuacion: 8, director: "Chad Stahelski", genero: "Acción", duracion: 169 },
  { titulo: "Killers of the Flower Moon", año: 2023, puntuacion: 9, director: "Martin Scorsese", genero: "Drama", duracion: 206 },
  { titulo: "Guardians of the Galaxy Vol. 3", año: 2023, puntuacion: 9, director: "James Gunn", genero: "Superhéroes", duracion: 150 },
  { titulo: "Wonka", año: 2023, puntuacion: 7, director: "Paul King", genero: "Familia", duracion: 116 },
  { titulo: "Mission: Impossible – Dead Reckoning", año: 2023, puntuacion: 8, director: "Christopher McQuarrie", genero: "Acción", duracion: 163 },
  // 2024
  { titulo: "Dune: Part Two", año: 2024, puntuacion: 9, director: "Denis Villeneuve", genero: "Ciencia ficción", duracion: 166 },
  { titulo: "Inside Out 2", año: 2024, puntuacion: 8, director: "Kelsey Mann", genero: "Animación", duracion: 96 },
  { titulo: "Deadpool & Wolverine", año: 2024, puntuacion: 8, director: "Shawn Levy", genero: "Superhéroes", duracion: 128 },
  { titulo: "The Hunger Games: Ballad of Songbirds & Snakes", año: 2024, puntuacion: 7, director: "Francis Lawrence", genero: "Aventura", duracion: 157 },
  { titulo: "Gladiator II", año: 2024, puntuacion: 7, director: "Ridley Scott", genero: "Acción", duracion: 148 }
])

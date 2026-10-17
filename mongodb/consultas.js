// MongoDB — consultas, actualizaciones y eliminaciones
use cine

// a) Películas de un año concreto
db.peliculas.find({ año: 2024 })

// b) Películas posteriores a 2022 — operador $gt
db.peliculas.find({ año: { $gt: 2022 } })

// c) Puntuación de un director — proyección de campos
db.peliculas.find({ director: "Steven Spielberg" }, { _id: 0, titulo: 1, puntuacion: 1 })

// d) Máxima puntuación (10)
db.peliculas.find({ puntuacion: 10 }, { _id: 0, titulo: 1, año: 1, puntuacion: 1, director: 1 })

// e) Consultas adicionales
db.peliculas.find({ puntuacion: { $gte: 9 } }, { _id: 0, titulo: 1, puntuacion: 1 })
db.peliculas.find({ genero: "Acción" }, { _id: 0, titulo: 1, genero: 1, director: 1 })
db.peliculas.find({ duracion: { $gt: 150 } }, { _id: 0, titulo: 1, duracion: 1 })

// f) Actualizaciones — $set añade campo, $inc incrementa valor
db.peliculas.updateMany({}, { $set: { idioma: "Inglés" } })
db.peliculas.updateMany({ año: 2024 }, { $set: { enCartelera: true } })
db.peliculas.updateMany({ genero: "Acción" }, { $inc: { puntuacion: 1 } })
db.peliculas.updateMany({ genero: "Superhéroes" }, { $set: { genero: "Superhéroe" } })

// g) Eliminaciones — $lt filtra por rango inferior
db.peliculas.deleteMany({ puntuacion: { $lt: 7 } })
db.peliculas.deleteMany({ genero: "Comedia" })
db.peliculas.deleteMany({ año: { $lt: 2022 } })
db.peliculas.deleteMany({ duracion: { $gt: 180 } })

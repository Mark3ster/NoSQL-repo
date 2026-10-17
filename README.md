# Cuatro formas de pensar los datos

Proyecto final de **Bases de Datos No Estructuradas** (UDIT, mayo 2026).
Cuatro tecnologías NoSQL, cuatro modelos de datos y cuatro problemas distintos.

**Autor:** _tu nombre aquí_

| Carpeta | Tecnología | Modelo | Caso de uso |
|---|---|---|---|
| [`mongodb/`](mongodb) | MongoDB | Documental | Catálogo de cine (24 películas) |
| [`redis/`](redis) | Redis | Clave-valor | Reservas de cine con holds temporales (TTL) |
| [`db4o-zodb/`](db4o-zodb) | db4o / ZODB | Orientada a objetos | Biblioteca y préstamos |
| [`neo4j/`](neo4j) | Neo4j | Grafos | Investigación interdisciplinaria y recomendaciones |

## Cómo ejecutarlo
- **MongoDB:** `mongosh < mongodb/datos.js` y después `mongosh < mongodb/consultas.js`.
- **Redis:** `redis-cli < redis/codigo_data.redis`.
- **db4o:** `db4o-zodb/Biblioteca.java` es un fragmento ilustrativo (no compila tal cual).
- **Neo4j:** ejecuta `neo4j/datos.cypher` y luego `neo4j/consultas.cypher` en Neo4j Browser o `cypher-shell`.

## Cuándo usar cada tecnología
| Tecnología | Úsala cuando… | Trade-off principal |
|---|---|---|
| MongoDB | La unidad de lectura es un objeto autocontenido y el esquema varía | Embedding complica las actualizaciones masivas |
| Redis | Importa la velocidad: sesiones, caché, expiración automática, rankings | Los datos deben caber en RAM |
| db4o / ZODB | El dominio es rico en OOP y quieres evitar la impedancia objeto-relacional | Ecosistema limitado; consultas ad-hoc difíciles |
| Neo4j | Las relaciones son el dato: redes, recomendaciones, caminos | No ideal para datos tabulares |

> No existe la base de datos universal: la habilidad está en reconocer el patrón del problema.

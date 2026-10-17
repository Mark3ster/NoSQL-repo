// a) PERTENECE_A — Estudiantes con disciplina
MATCH (e:Estudiante)-[:PERTENECE_A]->(d:Disciplina)
RETURN e.nombre, e.carrera, e.semestre, d.nombre ORDER BY e.nombre;

// b) TRATA_SOBRE — Proyectos y sus temas
MATCH (p:Proyecto)-[:TRATA_SOBRE]->(t:Tema)
RETURN p.titulo AS Proyecto, collect(t.nombre) AS Temas ORDER BY Proyecto;

// c) INVESTIGA_EN — Estudiantes y sus proyectos
MATCH (e:Estudiante)-[:INVESTIGA_EN]->(p:Proyecto)
RETURN e.nombre, collect(p.titulo) AS Proyectos ORDER BY e.nombre;

// d) INTERESADO_EN — Temas de interés por estudiante
MATCH (e:Estudiante)-[:INTERESADO_EN]->(t:Tema)
RETURN e.nombre, collect(t.nombre) AS Intereses ORDER BY e.nombre;

// e) COLABORA_CON — Pares de colaboración
MATCH (e1:Estudiante)-[:COLABORA_CON]->(e2:Estudiante)
RETURN e1.nombre, e2.nombre ORDER BY e1.nombre;

// OPCIONAL 1 — Mismo tema, distinta disciplina
MATCH (e1:Estudiante)-[:INVESTIGA_EN]->(p1:Proyecto)-[:TRATA_SOBRE]->(t:Tema)
MATCH (e2:Estudiante)-[:INVESTIGA_EN]->(p2:Proyecto)-[:TRATA_SOBRE]->(t)
MATCH (e1)-[:PERTENECE_A]->(d1:Disciplina)
MATCH (e2)-[:PERTENECE_A]->(d2:Disciplina)
WHERE e1.nombre < e2.nombre AND d1.nombre <> d2.nombre
RETURN DISTINCT e1.nombre, e2.nombre, t.nombre, d1.nombre, d2.nombre ORDER BY t.nombre;

// OPCIONAL 2 — Red de colaboración de un estudiante
MATCH (e:Estudiante {nombre:"Andrea"})-[:COLABORA_CON]-(c:Estudiante)
OPTIONAL MATCH (c)-[:INVESTIGA_EN]->(p:Proyecto)<-[:INVESTIGA_EN]-(e)
RETURN e.nombre, c.nombre, collect(p.titulo) AS ProyectosComunes;

// OPCIONAL 3 — Top 3 proyectos recomendados (3 saltos)
MATCH (e:Estudiante {nombre:"Andrea"})-[:INTERESADO_EN]->(t:Tema)
MATCH (p:Proyecto)-[:TRATA_SOBRE]->(t)
WHERE NOT EXISTS { MATCH (e)-[:INVESTIGA_EN]->(p) }
RETURN p.titulo, count(t) AS TemasCoincidentes ORDER BY TemasCoincidentes DESC LIMIT 3;

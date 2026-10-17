// Neo4j — Investigación universitaria: nodos y relaciones
// NOTA: las relaciones se reconstruyeron a partir de los resultados de ejecución del informe.

CREATE (:Estudiante {nombre:"Andrea", carrera:"Informatica", semestre:4})
CREATE (:Estudiante {nombre:"Carlos", carrera:"Informatica", semestre:6})
CREATE (:Estudiante {nombre:"Lucia",  carrera:"Biologia",    semestre:3})
CREATE (:Estudiante {nombre:"Marcos", carrera:"Matematicas", semestre:5})
CREATE (:Estudiante {nombre:"Pablo",  carrera:"Quimica",     semestre:5})
CREATE (:Estudiante {nombre:"Sara",   carrera:"Fisica",      semestre:4});

CREATE (:Disciplina {nombre:"Informatica"}) CREATE (:Disciplina {nombre:"Biologia"})
CREATE (:Disciplina {nombre:"Matematicas"}) CREATE (:Disciplina {nombre:"Quimica"})
CREATE (:Disciplina {nombre:"Fisica"});

CREATE (:Proyecto {titulo:"IA en Bioinformatica"})
CREATE (:Proyecto {titulo:"Analisis de Redes Complejas"})
CREATE (:Proyecto {titulo:"Modelos Epidemiologicos"})
CREATE (:Proyecto {titulo:"Simulacion Molecular"})
CREATE (:Proyecto {titulo:"Diagnostico Medico con ML"});

CREATE (:Tema {nombre:"Inteligencia Artificial"}) CREATE (:Tema {nombre:"Machine Learning"})
CREATE (:Tema {nombre:"Bioinformatica"}) CREATE (:Tema {nombre:"Redes"})
CREATE (:Tema {nombre:"Simulacion"}) CREATE (:Tema {nombre:"Epidemiologia"});

UNWIND [["Andrea","Informatica"],["Carlos","Informatica"],["Lucia","Biologia"],
        ["Marcos","Matematicas"],["Pablo","Quimica"],["Sara","Fisica"]] AS r
MATCH (e:Estudiante {nombre:r[0]}), (d:Disciplina {nombre:r[1]})
CREATE (e)-[:PERTENECE_A]->(d);

UNWIND [["Andrea","IA en Bioinformatica"],["Andrea","Analisis de Redes Complejas"],
        ["Carlos","Analisis de Redes Complejas"],["Lucia","IA en Bioinformatica"],
        ["Marcos","Modelos Epidemiologicos"],["Pablo","Simulacion Molecular"],
        ["Sara","Simulacion Molecular"],["Sara","Diagnostico Medico con ML"]] AS r
MATCH (e:Estudiante {nombre:r[0]}), (p:Proyecto {titulo:r[1]})
CREATE (e)-[:INVESTIGA_EN]->(p);

UNWIND [["Analisis de Redes Complejas","Inteligencia Artificial"],["Analisis de Redes Complejas","Redes"],
        ["Diagnostico Medico con ML","Inteligencia Artificial"],["Diagnostico Medico con ML","Machine Learning"],
        ["IA en Bioinformatica","Bioinformatica"],["IA en Bioinformatica","Inteligencia Artificial"],
        ["Modelos Epidemiologicos","Simulacion"],["Modelos Epidemiologicos","Epidemiologia"],
        ["Simulacion Molecular","Bioinformatica"],["Simulacion Molecular","Simulacion"]] AS r
MATCH (p:Proyecto {titulo:r[0]}), (t:Tema {nombre:r[1]})
CREATE (p)-[:TRATA_SOBRE]->(t);

UNWIND [["Andrea","Inteligencia Artificial"],["Andrea","Machine Learning"],
        ["Carlos","Redes"],["Carlos","Machine Learning"],
        ["Lucia","Inteligencia Artificial"],["Lucia","Bioinformatica"],
        ["Marcos","Epidemiologia"],["Marcos","Simulacion"],
        ["Pablo","Bioinformatica"],["Pablo","Simulacion"],
        ["Sara","Simulacion"],["Sara","Machine Learning"]] AS r
MATCH (e:Estudiante {nombre:r[0]}), (t:Tema {nombre:r[1]})
CREATE (e)-[:INTERESADO_EN]->(t);

UNWIND [["Andrea","Lucia"],["Andrea","Carlos"],["Carlos","Marcos"],["Sara","Pablo"]] AS r
MATCH (a:Estudiante {nombre:r[0]}), (b:Estudiante {nombre:r[1]})
CREATE (a)-[:COLABORA_CON]->(b);

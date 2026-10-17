// db4o (Java) — Biblioteca: clases persistentes y los 3 tipos de consulta.
// Fragmento ilustrativo: se asume una conexión `db` abierta y los objetos est1, l2... ya creados.

public class Autor {
    int idAutor; String nombre, apellidos, nacionalidad;
}
public class Editorial {
    int idEditorial; String nombre, ubicacion;
}
public class Libro {
    String ISBN, titulo, estatus;
    Editorial editorial;   // referencia directa
    int anioEdicion;
    Autor autor;           // referencia directa
}
public class Estudiante {
    String codigoEstudiante, nombre, apellidos, telefono, correoInstitucional;
}
public class Prestamo {
    int idPrestamo; Libro libro; Estudiante estudiante;
    Date fechaPrestamo, fechaDevolucionPrevista, fechaDevolucionReal; // null = pendiente
}

// ─── GUARDAR OBJETOS ───
Autor a1 = new Autor(1, "Gabriel", "Garcia Marquez", "Colombiana");
Editorial e1 = new Editorial(1, "Penguin Random House", "Madrid");
Libro l1 = new Libro("978-84-397-0498-5", "Cien años de soledad", e1, 1967, a1, "disponible");
Prestamo p1 = new Prestamo(1, l2, est1, new Date("2026-03-01"), new Date("2026-03-15"), new Date("2026-03-14"));
db.store(a1); db.store(e1); db.store(l1); db.store(p1); db.commit();

// ─── 1. QUERY BY CLASS ───
List<Autor> autores = db.query(Autor.class);

// ─── 2. QUERY BY EXAMPLE (QBE) — prototipo con nulos ───
Libro proto = new Libro(null, null, null, 0, null, "disponible");
List<Libro> disponibles = db.queryByExample(proto);

Estudiante protoEst = new Estudiante(null, null, null, null, "correo@ejemplo.es");
List<Estudiante> res = db.queryByExample(protoEst);

// ─── 3. NATIVE QUERY — predicado libre, type-safe ───
List<Prestamo> pendientes = db.query(new Predicate<Prestamo>() {
    public boolean match(Prestamo p) {
        return p.fechaDevolucionReal == null;
    }
});
for (Prestamo p : pendientes)
    System.out.println(p.libro.titulo + " → " + p.estudiante.nombre);

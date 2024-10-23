// cada materia tiene un curso
//inscripciones actuales
//historial de materias aprobadas de un estudiante

object programacion{

}
object medicina{

}
object derecho{

}

class Estudiante{
    const property gestor = new GestorEstudiante(nombre = self)
}

class GestorEstudiante{
    const nombre
    const property materiasAprobadas = []
    const property materiasInscriptoActual = []

    method materiaAprobada(materia, nota){
        materiasAprobadas.add(gestorAprobadaFactory.aprobada(nombre, materia, nota))
    }

    // PUNTO 2
    method cantAprobadas(){
        return materiasAprobadas.size()
    }

    method promedio(){
        return (materiasAprobadas.sum({gestorM => gestorM.nota()})) / self.cantAprobadas()
    }

    method tieneAprobada(materia){
        return listaAMaterias.materiasAprobadas(nombre).contains(materia)
    }

}

class GestorMateriaAprobada {
    var property estudiante
    var property materia
    var property nota
}
object gestorAprobadaFactory{
    method aprobada(estudiante, materia, nota){
        return new GestorMateriaAprobada(estudiante = estudiante, materia = materia, nota = nota)
    }
}

class Materia{
    const carrera
}


//TEST
object listaAMaterias{
    method materiasAprobadas(estudiante){
        return estudiante.gestor().materiasAprobadas().map({gestorM => gestorM.materia()})
    }
}
// cada materia tiene un curso
//inscripciones actuales
//historial de materias aprobadas de un estudiante

object programacion{
    var property materias = []
}

object medicina{  
    var property materias = [] 
}

object derecho{
    var property materias = []
}

class Estudiante{
    const property gestor = new GestorEstudiante(nombre = self)
}

class GestorEstudiante{
    const nombre
    const property materiasAprobadas = []
    const property materiasInscriptoActual = []

    method materiaAprobada(materia, nota){
        self.validarMateriaAprobada(materia)
        materiasAprobadas.add(gestorAprobadaFactory.agregar(nombre, materia, nota))
    }

    method inscribir(materia){
        materiasInscriptoActual.add(gestorInscriptoFactory.agregar(nombre, materia))
    }

    // PUNTO 2
    method cantAprobadas(){
        return materiasAprobadas.size()
    }

    method promedio(){
        return (materiasAprobadas.sum({gestorM => gestorM.nota()})) / self.cantAprobadas()
    }

    method tieneAprobada(materia){
        return listaAMaterias.materias(materiasAprobadas).contains(materia)
    }

    //PUNTO 3
    method validarMateriaAprobada(materia){
        if(self.tieneAprobada(materia)){
            self.error(materia + " ya fue cursada y aprobada")
        }
    }

    //PUNTO 4 preguntar
    method mateirasDeCarrerasInscripto(){
        return listaACarreras.carreras(materiasInscriptoActual).asSet().flatMap({carrera => carrera.materias()})
    }
    // se pueden hacer objetos para calcular cosas asi? o es mejor ponerlos en un método o hacerlo de otra forma?
 

}

class GestorMateria{
    var property estudiante
    var property materia
}

class GestorMateriaAprobada inherits GestorMateria {
    var property nota
}


object gestorAprobadaFactory{
    method agregar(estudiante, materia, nota){
        return new GestorMateriaAprobada(estudiante = estudiante, materia = materia, nota = nota)
    }
}

object gestorInscriptoFactory{
        method agregar(estudiante, materia){
        return new GestorMateria(estudiante = estudiante, materia = materia)
    }
}



class Materia{
    const property carrera
}


//TEST
object listaAMaterias{
    method materias(lista){
        return lista.map({gestorM => gestorM.materia()})
        //return estudiante.gestor().materiasAprobadas().map({gestorM => gestorM.materia()})
    }
}

object listaACarreras{
    method carreras(lista){
        return lista.map({gestorM => gestorM.materia().carrera()})
    }
}
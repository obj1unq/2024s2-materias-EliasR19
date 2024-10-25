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
    const property carreras = #{}
}

class GestorEstudiante{
    const nombre
    const property materiasAprobadas = []
    const property materiasInscriptoActual = []

    method inscribirCarrera(carrera){
        nombre.carreras().add(carrera)
    }

    method materiaAprobada(materia, nota){
        self.validarMateriaAprobada(materia)
        materiasAprobadas.add(gestorAprobadaFactory.agregar(nombre, materia, nota))
    }

    method inscribir(materia){
        self.validarInscribir(materia) // comentar para test todos los test antes del PUNTO 5
        gestorMateria.verificarCupoYAnotar(nombre, materia) //PUNTO 6
        //gestorMateria.anotarEstudiante(nombre, materia) //PUNTO 6
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
    method materiasDeCarrerasInscripto(){   //MOVER LA CARRERA, que el esutidnate si sepa su carrera
        return nombre.carreras().flatMap({carrera => carrera.materias()})
    }
    // se pueden hacer objetos para calcular cosas asi? o es mejor ponerlos en un método o hacerlo de otra forma?

    //PUNTO 5
    method validarInscribir(materia){
         if(!self.materiaPerteneceACarrera(materia) || self.tieneAprobada(materia) || self.estaInscriptoEn(materia) || !self.tieneCorrelativaDe(materia) ){
                self.error("No se puede inscribir")
            }
    }

    method materiaPerteneceACarrera(materia){
        return self.materiasDeCarrerasInscripto().contains(materia)
    }

    method estaInscriptoEn(materia){
        return listaAMaterias.materias(materiasInscriptoActual).contains(materia)
    }

    method tieneCorrelativaDe(materia){
        return  materia.correlativas().all({m => listaAMaterias.materias(materiasAprobadas).contains(m)})
    }
 
    //PUNTO 7 
    method darDeBaja(materia){
        materiasInscriptoActual.remove(self.buscarGestorDe(materia))
        gestorMateria.darDeBaja(nombre, materia)
        gestorMateria.inscribirSiguiente(materia)
    }

    method buscarGestorDe(materia){
        return materiasInscriptoActual.find({ gestorM => gestorM.materia() == materia})
    }
}

class GestorMateriaInscribir{
    var property estudiante
    var property materia
}

class GestorMateriaAprobada inherits GestorMateriaInscribir {
    var property nota
}


object gestorAprobadaFactory{
    method agregar(estudiante, materia, nota){
        return new GestorMateriaAprobada(estudiante = estudiante, materia = materia, nota = nota)
    }
}

object gestorInscriptoFactory{
        method agregar(estudiante, materia){
        return new GestorMateriaInscribir(estudiante = estudiante, materia = materia)
    }
}



class Materia{
    const property carrera
    var property correlativas = []

    var property cupo = 3 // canitdad maxima
    const property inscriptos = []
    const property listaEspera = []

    method anotarEstudiante(estudiante){
        inscriptos.add(estudiante)
    }

    method agregarALista(estudiante){
        listaEspera.add(estudiante)
    }

}

object gestorMateria {

    method anotarEstudiante(estudiante, materia){
        materia.anotarEstudiante(estudiante)
        
    }


    method anotarEnLista(estudiante, materia){
        materia.agregarALista(estudiante)
    }

    method verificarCupoYAnotar(estudiante, materia){
        if(materia.inscriptos().size() >= materia.cupo()){
            self.anotarEnLista(estudiante, materia)
            self.error("No hay cupo, queda en lista de espera")            
        } else {
            self.anotarEstudiante(estudiante, materia)
        }
    }

    method inscribirSiguiente(materia){

        if(!materia.listaEspera().isEmpty()){
            const estudiante = materia.listaEspera().head()
            materia.listaEspera().remove(estudiante)

            estudiante.gestor().inscribir(materia)
            //self.anotarEstudiante(estudiante, materia)
        }
    }

    method darDeBaja(estudiante, materia){
        materia.inscriptos().remove(estudiante)
    }
}


//TEST
object listaAMaterias{
    method materias(lista){
        return lista.map({gestorM => gestorM.materia()})
        //return estudiante.gestor().materiasAprobadas().map({gestorM => gestorM.materia()})
    }
}

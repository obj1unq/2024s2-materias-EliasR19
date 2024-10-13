//ESTUDIANTE
class Estudiante{
    
    const property gestor = new GestorEstudiante()
    method inscribirCarrera(carrera){
        gestor.inscribirCarrera(carrera)
    }
    method inscribirMateria(materia, nota){
        gestor.inscribir(self, materia, nota)
    }
}

class GestorEstudiante{
    const property carreras = []
    const property inscripto = []
    const property materiasAprobadas = []

    method inscribirCarrera(carrera){
        carreras.add(carrera)
    }

    method inscribir(estudiante, materia, nota){
        self.validarInscribir(materia)
        inscripto.add(cursadaFactory.crear(estudiante, materia, nota))
        instanciaAprobacion.evaluar(inscripto.last())
    }

    method validarInscribir(materia){
        if(!self.validarCarrera(materia) || self.validarYaCursada(materia) || !self.validarCorrelativas(materia)){
            self.error("No se puede inscribir")
        }
    }

    //la materia ya fue cursada
    method validarYaCursada(materia){
        return materiasAprobadas.any({cursada => cursada.materia() == materia})
    }
    //el estudiante no esta cursando esta carrera
    method validarCarrera(materia){
        return carreras.any({carrera => carrera == materia.carrera()})
    }
    //el estudiante tiene ya aprobadas las correlativas de x carrera
    method validarCorrelativas(materia){
        return materia.correlativas().all( {materiaCor => self.aproboCorrelativa(materiaCor) })
    }
    method aproboCorrelativa(correlativa){
        return materiasAprobadas.any({cursada => cursada.materia() == correlativa})
    }





    //CANT APROBADAS
    method cantAprobadas(){
        return inscripto.count({cursada => cursada.estaAprobada()})
        //return materiasAprobadas.size()
    }

    //PROMERO
    // con todas las materias o solo las aprobadas?
    method promedio(){
        return inscripto.sum({cursada => cursada.nota()}) / self.cantAprobadas()
    }

    //TIENE O NO APROBADAS
    method tieneAprobadas(){
        return self.cantAprobadas() > 0
        // return !materiasAprobadas.isEmpty()
    }
    
    //coleccion de materas
    method materiasTotal(){
        return inscripto.map({cursada => cursada.materia()})
    }

}

class Cursada{

    var property nombreEstudiante
    var property materia
    var property nota

    method estaAprobada(){
        return nota >= 4
    }
}



object instanciaAprobacion{
    method evaluar(cursada){
        if(cursada.nota() >= 4){
            cursada.nombreEstudiante().gestor().materiasAprobadas().add(cursada)
        }
    }

}

object cursadaFactory{
    method crear(estudiante, materia, nota){
        return new Cursada(nombreEstudiante= estudiante, materia = materia, nota = nota)
    }
}


/// EXTRAS

//CARRERAS 
object programacion{

}
object medicina{

}
object derecho{

}

//MATERIAS
class Materia{
    const property carrera
    var property correlativas

}
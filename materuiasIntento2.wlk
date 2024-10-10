//ESTUDIANTE
class Estudiante{
    
    const property gestor = new GestorEstudiante()

    method inscribir(materia, nota){
        gestor.inscribir(self, materia, nota)
    }
}

class GestorEstudiante{
    //const property historialAcademico = []
    const property historialCursadas = []
    const property materiasAprobadas = []

    method inscribir(estudiante, materia, nota){
        self.validarInscribir(materia)
        historialCursadas.add(cursadaFactory.crear(estudiante, materia, nota))
        instanciaAprobacion.evaluar(estudiante, materia, nota)
    }

    method validarInscribir(materia){
        if(materiasAprobadas.contains(materia)){
            self.error("Ya fue cursada y esta aprobada")
        }
    }

    //CANT APROBADAS
    method cantAprobadas(){
        return historialCursadas.count({cursada => cursada.estaAprobada()})
    }

    //PROMERO
    method promedio(){
        return historialCursadas.sum({cursada => cursada.nota()}) / self.cantAprobadas()
    }

    //TIENE O NO APROBADAS
    method tieneAprobadas(){
        return self.cantAprobadas() > 0
    }
    

    method materiasTotal(){
        return historialCursadas.map({cursada => cursada.materia()})
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
    method evaluar(estudiante, materia, nota){
        if(nota >= 4){
            estudiante.gestor().materiasAprobadas().add(materia)
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
    const carrera

}
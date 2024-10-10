

//ESTUDIANTE
class Estudiante{
    
    const property gestor = new GestorEstudiante()

    method inscribir(materia, nota){
        gestor.evaluarAprobacion(self, materia, nota)
    }
}

class GestorEstudiante{
    //const property historialAcademico = []
    const property historialCursadasAprobadas = []


    //NUEVA MATEIRA
    method evaluarAprobacion(estudiante, materia, nota){
        self.validarMateria(materia)
        instanciaAprobacion.aprobo(estudiante, materia, nota)
    }

    method validarMateria(materia){
        if(self.materiasAprobadas().contains(materia)){
            self.error("Esa materia ya esta curdasa")
        }
    }

    method materiasAprobadas(){
        return historialCursadasAprobadas.map({aprobada => aprobada.materia()})
    }

    method agregarMateriaAprobada(estudiante,materia, nota){
        historialCursadasAprobadas.add(cursadaFactory.crear(estudiante,materia, nota))
    }

    //CANRTIDAD APROBADAS
    method cantMateriasAprobadas() {
        return historialCursadasAprobadas.size()
    }

    //PROMEIDO
    method promedioMaterias(){
        return historialCursadasAprobadas.sum({materia => materia.nota()}) / self.cantMateriasAprobadas()
    }

    //TIENE O NO MATERIAS APROBADAS
    method tieneMateriasAprobadas(){
        return !historialCursadasAprobadas.isEmpty()
    }

    //TODAS LAS MATERIAS DE TODAS LAS CARRERAS A LAS QUE ESTA INSCRIPTO
    method materiasTotales(){
        return self.materiasAprobadas()
    }

}

class Cursada{

    var property nombreEstudiante
    var property materia
    var property nota

}

object instanciaAprobacion{

    method aprobo(estudiente, materia, nota) {
        if(nota >= 4){
            estudiente.gestor().agregarMateriaAprobada(estudiente, materia, nota)
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
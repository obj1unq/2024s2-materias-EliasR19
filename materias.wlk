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

//ESTUDIANTE
class Estudiante{
    
    const property gestor = new GestorEstudiante()

    method cursoMateria(materia, nota){
        gestor.evaluarAprobacion(self, materia, nota)
    }
}

class GestorEstudiante{
    //const property historialAcademico = []
    const property historialMateriasAprobadas = []


    //NUEVA MATEIRA
    method evaluarAprobacion(estudiante, materia, nota){
        instanciaAprobacion.aprobo(estudiante, materia, nota)
    }

    method agregarMateriaAprobada(estudiante,materia, nota){
        historialMateriasAprobadas.add(new Cursada(nombreEstudiante= estudiante, materia = materia, nota = nota))
    }

    //CANRTIDAD APROBADAS
    method cantMateriasAprobadas() {
        return historialMateriasAprobadas.size()
    }

    //PROMEIDO
    method promedioMaterias(){
        return historialMateriasAprobadas.sum({materia => materia.nota()}) / self.cantMateriasAprobadas()
    }

    //TIENE O NO MATERIAS APROBADAS
    method tieneMateriasAprobadas(){
        return !historialMateriasAprobadas.isEmpty()
    }

    //CANTIDAD DE MATERIAS APROBADAS
    /*
    method cantMateriasAprobadas() {
        return historialAcademico.count({materia => materia.estaAprobada()})
    }

    //PROMEDIO

    method promedioMaterias(){
        return (historialAcademico.sum({materia => materia.nota()})) / historialAcademico.size()
    }

    //TIENE O NO MATERIAS APROBADAS
    method tieneMateriasAprobadas(){
        return historialAcademico.any({materia => materia.estaAprobada()})
    }
    */
}

class Cursada{

    var property nota
    var property materia
    var property nombreEstudiante

    method estaAprobada(){
        return nota >= 4
    }

}

object instanciaAprobacion{

    method aprobo(estudiente, materia, nota) {
        if(nota >= 4){
            estudiente.gestor().agregarMateriaAprobada(estudiente, materia, nota)
        }
    }
}
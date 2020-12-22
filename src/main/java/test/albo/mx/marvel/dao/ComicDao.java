/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.dao;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import test.albo.mx.marvel.model.Comic;

/**
 * Interface que contiene los metodos crud inyectados por spring.
 *
 * @version 1.0, 21/12/20
 * @author Edgar Salinas
 */
public interface ComicDao extends CrudRepository<Comic, Long> {

    /** 
     * Consulta nativa a la base de datos.
     * Proyecta los comics de un determinado personaje
     * @param idPerson De tipo Integer es el identificador del personaje
     * @return retorna una lista de objetos tipo Comic, registros
     * encontrados en la base de datos
     */
    @Query(value = "SELECT idcomic, idcomicservice, title, name, person.idcharacter "
            + " from comic inner join person using(idcharacter) "
            + " where idcomicservice in"
            + "(select idcomicservice from comic where idcharacter = ?1)"
            + " and idcharacter <> ?1",
            nativeQuery = true)
    public List<Comic> findCharacters(Integer idPerson);
}

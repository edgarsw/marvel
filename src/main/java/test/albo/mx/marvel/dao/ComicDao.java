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
 *
 * @author edgar
 */
public interface ComicDao extends CrudRepository<Comic, Long> {

    @Query(value = "SELECT * from comic"
            + " where idcomicservice in(select idcomicservice from comic where idcharacter = 1009149)"
            + " and idcharacter <> 1009149",
            nativeQuery = true)
    public List<Comic> findCharacters(Integer idPerson);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.dao;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import test.albo.mx.marvel.model.Editor;
import test.albo.mx.marvel.model.Writer;

/**
 *
 * @author edgar
 */
public interface WriterDao extends CrudRepository<Writer, Long>{
    @Query(value = "SELECT count(*) FROM writer WHERE name = ?1 AND idcharacter = ?2",
            nativeQuery = true)
    public long findByNameCharacter(String name, Integer id);
    
     @Query(value = "SELECT idwriter, name, idcharacter FROM writer WHERE idcharacter = ?1",
            nativeQuery = true)
    public List<Writer> findWriter(Integer idPerson);
}

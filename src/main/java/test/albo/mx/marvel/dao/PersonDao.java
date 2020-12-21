/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import test.albo.mx.marvel.model.Person;

/**
 *
 * @author edgar
 */
public interface PersonDao extends JpaRepository<Person, Long> {
    
    @Query(value = "SELECT idcharacter, name, DATE_FORMAT(last_sync, '%d/%m/%Y %H:%i:%s') as last_sync FROM person WHERE name = ?1 limit 1",
            nativeQuery = true)
    public Person findIdByName(String name);  
}
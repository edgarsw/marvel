/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service;

import java.util.List;
import test.albo.mx.marvel.model.Person;
/**
 *
 * @author edgar
 */
public interface PersonService {
    public void deleteAll();
    public void ins(Person person);
    public Person findIdByName(String name);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.albo.mx.marvel.service.PersonService;
import test.albo.mx.marvel.model.Person;
import test.albo.mx.marvel.dao.PersonDao;
/**
 *
 * @author edgar
 */
@Service
public class PersonServiceImp implements PersonService{
    
    @Autowired
    private PersonDao personDao;

    @Override
    @Transactional
    public void deleteAll() {
        personDao.deleteAll();
    }

    @Override
    @Transactional
    public void ins(Person person) {
        personDao.save(person);
    }
    
    @Override
    @Transactional(readOnly = true) 
    public Person findIdByName(String name){
        return personDao.findIdByName(name);
    }
}

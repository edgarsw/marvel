/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service.imp;

import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.albo.mx.marvel.dao.ComicDao;
import test.albo.mx.marvel.model.Comic;
import test.albo.mx.marvel.service.ComicService;

/**
 *
 * @author edgar
 */
@Service
@Slf4j
public class ComicServiceImp implements ComicService {

    @Autowired
    private ComicDao comicDao;

    @Override
    @Transactional
    public void ins(Comic comic) {
        comicDao.save(comic);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Comic> findCharacters(Integer idPerson) {
        return (List<Comic>) comicDao.findCharacters(idPerson);
    }
}

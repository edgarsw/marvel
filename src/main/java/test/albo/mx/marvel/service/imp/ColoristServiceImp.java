/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service.imp;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.albo.mx.marvel.dao.ColoristDao;
import test.albo.mx.marvel.model.Colorist;
import test.albo.mx.marvel.model.Editor;
import test.albo.mx.marvel.model.Person;
import test.albo.mx.marvel.service.ColoristService;

/**
 *
 * @author edgar
 */
@Service
public class ColoristServiceImp implements ColoristService {

    @Autowired
    private ColoristDao coloristDao;

    @Override
    @Transactional
    public void ins(Colorist colorist) {
        coloristDao.save(colorist);
    }

    @Override
    @Transactional(readOnly = true) 
    public long countColorist(Colorist colorist) {
        return coloristDao.findByNameCharacter(colorist.getName(), colorist.getIdCharacter());
    }
    
    @Override
    @Transactional(readOnly = true) 
    public List<Colorist> findColoristsByCharacter(Integer idPerson){
        return coloristDao.findColorist(idPerson);
    }

}

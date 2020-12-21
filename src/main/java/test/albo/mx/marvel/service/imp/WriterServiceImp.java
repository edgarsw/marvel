/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service.imp;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.albo.mx.marvel.dao.WriterDao;
import test.albo.mx.marvel.model.Editor;
import test.albo.mx.marvel.model.Writer;
import test.albo.mx.marvel.service.WriterService;

/**
 *
 * @author edgar
 */
@Service
public class WriterServiceImp implements WriterService {
    
    @Autowired
    private WriterDao writerDao;
    
    @Override
    @Transactional
    public void ins(Writer writer) {
        writerDao.save(writer);
    }
    
    @Override
    @Transactional(readOnly = true) 
    public long countWriter(Writer writer) {
        return writerDao.findByNameCharacter(writer.getName(), writer.getIdCharacter());
    }
    
    @Override
    @Transactional(readOnly = true) 
    public List<Writer> findWritersByCharacter(Integer idPerson){
        return writerDao.findWriter(idPerson);
    }
}

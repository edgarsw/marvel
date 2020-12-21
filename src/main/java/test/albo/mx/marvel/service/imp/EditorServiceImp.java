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
import test.albo.mx.marvel.dao.EditorDao;
import test.albo.mx.marvel.model.Editor;
import test.albo.mx.marvel.service.EditorService;

/**
 *
 * @author edgar
 */
@Service
public class EditorServiceImp implements EditorService {
    @Autowired
    private EditorDao editorDao;
    
    @Override
    @Transactional
    public void ins(Editor editor) {
        editorDao.save(editor);
    }
    
    
    @Override
    @Transactional(readOnly = true) 
    public long countEditor(Editor editor) {
        return editorDao.findByNameCharacter(editor.getName(), editor.getIdCharacter());
    }
    
    @Override
    @Transactional(readOnly = true) 
    public List<Editor> findEditorsByCharacter(Integer idPerson){
        return editorDao.findEditor(idPerson);
    }
}

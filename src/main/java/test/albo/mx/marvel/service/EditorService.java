/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service;

import java.util.List;
import test.albo.mx.marvel.model.Editor;

/**
 *
 * @author edgar
 */
public interface EditorService {
    public void ins(Editor editor);
    public long countEditor(Editor editor);
    public List<Editor> findEditorsByCharacter(Integer idCharacter);
}

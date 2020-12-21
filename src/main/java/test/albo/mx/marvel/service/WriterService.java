/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service;

import java.util.List;
import test.albo.mx.marvel.model.Editor;
import test.albo.mx.marvel.model.Writer;

/**
 *
 * @author edgar
 */
public interface WriterService {
    public void ins(Writer writer);
    public long countWriter(Writer writer);
    public List<Writer> findWritersByCharacter(Integer idCharacter);
}

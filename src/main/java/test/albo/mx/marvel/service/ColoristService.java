/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service;

import java.util.List;
import test.albo.mx.marvel.model.Colorist;
import test.albo.mx.marvel.model.Editor;

/**
 *
 * @author edgar
 */
public interface ColoristService {
    public void ins(Colorist colorist);
    public long countColorist(Colorist colorist);
    public List<Colorist> findColoristsByCharacter(Integer idCharacter);
    
}

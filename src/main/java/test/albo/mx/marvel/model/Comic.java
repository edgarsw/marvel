/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

/**
 * Entidad comic
 *
 * @version 1.0, 21/12/20
 * @author Edgar Salinas
 */
@Data
@Entity
@Table(name = "comic")
public class Comic implements Serializable{
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idcomic")
    private Integer idComic;
    
    @Column(name = "idcomicservice")
    private Integer idComicService;
    private String title;
    @Column(name = "idcharacter")
    private Integer idCharacter;
    
    private String name;
}

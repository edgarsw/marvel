/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author edgar
 */
@Data
@Entity
@Table(name = "person")
public class Person implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Id
    //@GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "idcharacter")
    private Integer idCharacter;
    private String name;
    @Column(name = "last_sync")
    private String lastSync;
}

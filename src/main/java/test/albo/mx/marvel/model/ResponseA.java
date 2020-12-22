/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.model;

import java.util.List;
import lombok.Data;

/**
 *
 * @author edgar
 */
@Data
public class ResponseA {
    private String last_sync;
    private List<String> editors;
    private List<String> writers;
    private List<String> colorists;
}

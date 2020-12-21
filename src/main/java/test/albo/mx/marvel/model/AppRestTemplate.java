/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.model;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author edgar
 */
//@Configuration
public class AppRestTemplate {
    
    //@Bean("restTemplate")
    public RestTemplate getColaborators(){
        return new RestTemplate();
    }
}

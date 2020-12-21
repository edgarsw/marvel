/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.service.imp;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import test.albo.mx.marvel.MarvelApplication;
import test.albo.mx.marvel.service.ColaboratorsService;

/**
 *
 * @author edgar
 */
@Service
@Slf4j
public class ColaboratorsServiceImp implements ColaboratorsService {

    @Autowired
    private RestTemplate restTemplate;

    @Override
    public void getColaboratorsWS() {
        String object = restTemplate.getForObject(
                "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=5ed84d39a66681a5a755607b5f53734a&hash=3a7a16b482789803a387a6f8709f6f51", String.class);
        
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
        try {
            JsonNode actualObj = mapper.readTree(object);
            log.info(actualObj.toString());
        } catch (JsonProcessingException ex) {
            Logger.getLogger(MarvelApplication.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ColaboratorsServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        log.info(object);
    }
}

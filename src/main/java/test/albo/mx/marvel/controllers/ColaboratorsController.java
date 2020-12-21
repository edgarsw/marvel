/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.albo.mx.marvel.controllers;

import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import test.albo.mx.marvel.model.Comic;
import test.albo.mx.marvel.model.Person;
import test.albo.mx.marvel.service.ColoristService;
import test.albo.mx.marvel.service.ComicService;
import test.albo.mx.marvel.service.EditorService;
import test.albo.mx.marvel.service.PersonService;
import test.albo.mx.marvel.service.WriterService;

/**
 *
 * @author edgar
 */
@RestController
@Slf4j
public class ColaboratorsController {

    @Autowired
    private ComicService comicService;

    @Autowired
    private PersonService personService;

    @Autowired
    private ColoristService coloristService;
    @Autowired
    private EditorService editorService;
    @Autowired
    private WriterService writerService;

    //@Autowired
    //private ColaboratorsService colaboratorsService;
    @Value("${mensaje.saludo}")
    //private String saludo;
    String respuesta = "";

    @GetMapping("/marvel/colaborators/{name}")
    public String colaborators(@PathVariable String name) {
        log.info("controller colaborators executed");
        
        Person person = personService.findIdByName(name);
        Integer idCharacter = person.getIdCharacter();

        List list = editorService.findEditorsByCharacter(idCharacter);
        StringBuilder sb = new StringBuilder();
        list.stream().forEach(e -> {
            sb.append("\"");
            sb.append(e);
            sb.append("\"");
            sb.append(", ");
        });

        list = writerService.findWritersByCharacter(idCharacter);
        StringBuilder sbw = new StringBuilder();
        list.stream().forEach(e -> {
            sbw.append("\"");
            sbw.append(e);
            sbw.append("\"");
            sbw.append(", ");
        });

        list = coloristService.findColoristsByCharacter(idCharacter);
        StringBuilder sbc = new StringBuilder();
        list.stream().forEach(e -> {
            sbc.append("\"");
            sbc.append(e);
            sbc.append("\"");
            sbc.append(", ");
        });

        String fecha = "last_sync: \"" + person.getLastSync() + "\"";

        return "{ " + fecha + ","
                + "editors:[" + sb.toString() + "],"
                + "writers:[" + sbw.toString() + "],"
                + "colorists:[" + sbw.toString() + "]," + '}';
    }
    
    @GetMapping("/marvel/characters/{name}")
    public List characters(@PathVariable String name) {
        log.info("controller characters executed");
        
        Person person = personService.findIdByName(name);
        Integer idCharacter = person.getIdCharacter();
        
        List list = comicService.findCharacters(idCharacter);
        return list;
    }
}

package test.albo.mx.marvel.controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import test.albo.mx.marvel.model.Colorist;
import test.albo.mx.marvel.model.Comic;
import test.albo.mx.marvel.model.Editor;
import test.albo.mx.marvel.model.Person;
import test.albo.mx.marvel.model.ResponseA;
import test.albo.mx.marvel.model.ResponseB;
import test.albo.mx.marvel.model.ResponseBCharacter;
import test.albo.mx.marvel.model.Writer;
import test.albo.mx.marvel.service.ColoristService;
import test.albo.mx.marvel.service.ComicService;
import test.albo.mx.marvel.service.EditorService;
import test.albo.mx.marvel.service.PersonService;
import test.albo.mx.marvel.service.WriterService;

/**
 * Controlador rest que contine las rutas de solicitud.
 *
 * @version 1.0, 21/12/20
 * @author Edgar Salinas
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
    
    private int idCh = 0;
    private List<String> comics;
    private ResponseBCharacter rbc;

    /**
     * Procesa la solicitud para entregar los colaboradores.
     *
     * @param name Recibe la variable que contiene el personaje de que se requiere la
     * informacion
     * @return Devuelve un String con la informacion procesada
     */    
    @GetMapping("/marvel/colaborators/{name}")
    public ResponseA colaborators(@PathVariable String name) {
        log.info("controller colaborators executed");

        Person person = personService.findIdByName(name);
        Integer idCharacter = person.getIdCharacter();

        ResponseA response = new ResponseA();
        List<Editor> listEditor = editorService.findEditorsByCharacter(idCharacter);
        List<Writer> listWriter = writerService.findWritersByCharacter(idCharacter);
        List<Colorist> listColorist = coloristService.findColoristsByCharacter(idCharacter);
        List responseEditor = new ArrayList();
        List responseWriter = new ArrayList();
        List responseColorist = new ArrayList();
        
        listEditor.forEach(editor -> {
            responseEditor.add(editor.getName());
        });
        
        listWriter.forEach(writer -> {
            responseWriter.add(writer.getName());
        });
        
        listColorist.forEach(colorist -> {
            responseColorist.add(colorist.getName());
        });
        
        Collections.sort(responseEditor);
        Collections.sort(responseWriter);
        Collections.sort(responseColorist);
        
        response.setLast_sync(person.getLastSync());
        response.setEditors(responseEditor);
        response.setWriters(responseWriter);
        response.setColorists(responseColorist);
        
        return response;
    }

    /**
     * Procesa la solicitud para entregar los personajes involucrados con el
     * personaje solicitado.
     *
     * @param name Recibe la variable que contiene el personaje de que se requiere la
     * informacion
     * @return Devuelve una Lista con la informacion procesada
     */
    @GetMapping("/marvel/characters/{name}")
    public ResponseB characters(@PathVariable String name) {
        log.info("controller characters executed");

        Person person = personService.findIdByName(name);
        Integer idCharacter = person.getIdCharacter();

        List<Comic> list = comicService.findCharacters(idCharacter);
        ResponseB response = new ResponseB();
        List<ResponseBCharacter> characters = new ArrayList();
                
        list.forEach(comic ->{
            if(comic.getIdCharacter() != idCh){
                idCh = comic.getIdCharacter();
                rbc = new ResponseBCharacter();                
                characters.add(rbc);
                comics = new ArrayList();
                rbc.setCharacter(comic.getName()); 
                rbc.setComics(comics);
            }            
            comics.add(comic.getTitle());
        });
        
        response.setLast_sync(person.getLastSync());
        response.setCharacters(characters);
        
        return response;
    }
}

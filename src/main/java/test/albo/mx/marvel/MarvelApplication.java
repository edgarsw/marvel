package test.albo.mx.marvel;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import test.albo.mx.marvel.model.Colorist;
import test.albo.mx.marvel.model.Comic;
import test.albo.mx.marvel.model.Editor;
import test.albo.mx.marvel.service.ComicService;
import test.albo.mx.marvel.model.Person;
import test.albo.mx.marvel.model.Writer;
import test.albo.mx.marvel.service.ColoristService;
import test.albo.mx.marvel.service.EditorService;
import test.albo.mx.marvel.service.PersonService;
import test.albo.mx.marvel.service.WriterService;

@SpringBootApplication
@Slf4j
@Component
public class MarvelApplication {

    @Autowired
    private ComicService comicService;

    @Autowired
    private PersonService personService;

    @Autowired
    private EditorService editorService;

    @Autowired
    private WriterService writerService;

    @Autowired
    private ColoristService coloristService;

    @Value("${credentials}")
    private String credentials;

    public static void main(String[] args) {
        SpringApplication.run(MarvelApplication.class, args);
    }

    @Scheduled(cron = "0 48 10 * * *")
    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        return builder.build();
    }    
    
    @Bean
    public CommandLineRunner run(RestTemplate restTemplate) throws Exception {
        saveServices(restTemplate);
        return args -> {

        };
    }

    
    private void saveServices(RestTemplate restTemplate) {
        String object = restTemplate.getForObject(
                "https://gateway.marvel.com/v1/public/characters?" + credentials, String.class);

        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
        try {
            personService.deleteAll();
            JsonNode actualObj = mapper.readTree(object);
            JsonNode dataObj = actualObj.get("data");
            JsonNode resultObj = dataObj.get("results");

            //insert heroes
            resultObj.forEach(element -> {
                try {
                    Person person = new Person();
                    person.setIdCharacter(element.get("id").asInt());
                    person.setName(element.get("name").asText());
                    personService.ins(person);

                    //come in collection uri to get colaborators
                    String collectionUri = restTemplate.getForObject("http://gateway.marvel.com/v1/public/characters/" + person.getIdCharacter() + "/comics?" + credentials, String.class);
                    ObjectMapper mapperUri = new ObjectMapper();
                    mapperUri.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
                    JsonNode objUri = mapper.readTree(collectionUri);
                    JsonNode dataUri = objUri.get("data");
                    JsonNode resultUri = dataUri.get("results");

                    resultUri.forEach(elementUri -> {
                        
                        Comic comic = new Comic();
                        comic.setIdCharacter(person.getIdCharacter());
                        comic.setIdComicService(elementUri.get("id").asInt());
                        comic.setTitle(elementUri.get("title").asText());
                        comicService.ins(comic);
                        
                        JsonNode creatorsObj = elementUri.get("creators");
                        JsonNode itemsObj = creatorsObj.get("items");
                        itemsObj.forEach(colaborator -> {
                            switch (colaborator.get("role").asText()) {
                                case "editor":
                                    Editor editor = new Editor();
                                    editor.setName(colaborator.get("name").asText());
                                    editor.setIdCharacter(person.getIdCharacter());
                                    if (editorService.countEditor(editor) <= 0) {
                                        editorService.ins(editor);
                                    }
                                    break;
                                case "writer":
                                    Writer writer = new Writer();
                                    writer.setName(colaborator.get("name").asText());
                                    writer.setIdCharacter(person.getIdCharacter());
                                    if (writerService.countWriter(writer) <= 0) {
                                        writerService.ins(writer);
                                    }
                                    break;
                                case "colorist":
                                    Colorist colorist = new Colorist();
                                    colorist.setName(colaborator.get("name").asText());
                                    colorist.setIdCharacter(person.getIdCharacter());
                                    if (coloristService.countColorist(colorist) <= 0) {
                                        coloristService.ins(colorist);
                                    }
                                    break;
                            }
                        });
                    });
                } catch (NullPointerException ex) {
                    log.info(ex.getMessage());
                } catch (JsonProcessingException ex) {
                    Logger.getLogger(MarvelApplication.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(MarvelApplication.class.getName()).log(Level.SEVERE, null, ex);
                }

            });
        } catch (JsonProcessingException ex) {
            Logger.getLogger(MarvelApplication.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(MarvelApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

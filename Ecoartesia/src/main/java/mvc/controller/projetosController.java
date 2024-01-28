package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class projetosController {

    @GetMapping("/projetos")
    public String index() {
        return "views/projetos/index"; 
    }
}
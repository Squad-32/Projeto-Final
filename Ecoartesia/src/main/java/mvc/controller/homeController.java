package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeController {

    @GetMapping("/cursos")
    public String cursos() {
        return "views/cursos/index"; 
    }

    @GetMapping("/projetos")
    public String projetos() {
        return "views/projetos/index"; 
    }

    @GetMapping("/faca")
    public String faca() {
        return "views/faca/index"; 
    }

    @GetMapping("/sobre")
    public String sobre() {
        return "views/sobre/index"; 
    }
}
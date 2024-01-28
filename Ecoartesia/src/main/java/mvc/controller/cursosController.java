package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class cursosController {

    @GetMapping("/cursos")
    public String index() {
        return "views/cursos/index"; 
    }
}
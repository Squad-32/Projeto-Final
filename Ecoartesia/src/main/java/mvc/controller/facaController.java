package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class facaController {

    @GetMapping("/faca")
    public String index() {
        return "views/faca/index"; 
    }
}
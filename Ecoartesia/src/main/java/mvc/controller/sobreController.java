package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class sobreController {

    @GetMapping("/sobre")
    public String index() {
        return "views/sobre/index"; 
    }
}
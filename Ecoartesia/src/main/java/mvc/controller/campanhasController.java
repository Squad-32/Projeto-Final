package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Campanhas;
import mvc.repository.CampanhasRepository;

@Controller
@RequestMapping("/campanhas")
public class campanhasController {

    @Autowired
    private CampanhasRepository campanhasRepository;

    @GetMapping
    public ModelAndView listarCampanhas() {
        ModelAndView modelAndView = new ModelAndView("views/campanhas/index.html");
        modelAndView.addObject("campanhas", campanhasRepository.findAll());
        return modelAndView;
    }

    @PostMapping("/cadastrar")
    public String cadastrarCampanha(Campanhas campanha) {
        campanhasRepository.save(campanha);
        return "redirect:/campanhas";
    }

    @GetMapping("/editar/{id}")
    public ModelAndView editarCampanha(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/campanhas/editar.html");
        Campanhas campanha = campanhasRepository.findById(id).orElse(null);
        modelAndView.addObject("campanha", campanha);
        return modelAndView;
    }

    @PostMapping("/atualizar/{id}")
    public String atualizarCampanha(@PathVariable Long id, Campanhas campanha) {
        campanha.setId(id);
        campanhasRepository.save(campanha);
        return "redirect:/campanhas";
    }

    @DeleteMapping("/deletar/{id}")
    public String deletarCampanha(@PathVariable Long id) {
        campanhasRepository.deleteById(id);
        return "redirect:/campanhas";
    }
}
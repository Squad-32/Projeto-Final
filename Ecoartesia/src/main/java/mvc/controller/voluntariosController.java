package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Voluntarios;
import mvc.repository.VoluntariosRepository;

@Controller
@RequestMapping("/voluntarios")
public class voluntariosController {

    @Autowired
    private VoluntariosRepository voluntariosRepository;

    @GetMapping
    public ModelAndView listarVoluntarios() {
        ModelAndView modelAndView = new ModelAndView("views/voluntarios/index");
        modelAndView.addObject("voluntarios", voluntariosRepository.findAll());
        return modelAndView;
    }

    @GetMapping("/cadastrar")
    public ModelAndView cadastrarForm() {
        ModelAndView modelAndView = new ModelAndView("views/voluntarios/cadastrar");
        modelAndView.addObject("voluntario", new Voluntarios());
        return modelAndView;
    }

    @PostMapping("/cadastrar")
    public String cadastrarVoluntario(Voluntarios voluntario) {
        voluntariosRepository.save(voluntario);
        return "redirect:/voluntarios";
    }

    @GetMapping("/editar/{id}")
    public ModelAndView editarVoluntario(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/voluntarios/editar");
        Voluntarios voluntario = voluntariosRepository.findById(id).orElse(null);
        modelAndView.addObject("voluntario", voluntario);
        return modelAndView;
    }

    @PostMapping("/atualizar/{id}")
    public String atualizarVoluntario(@PathVariable Long id, Voluntarios voluntario) {
        voluntario.setId(id);
        voluntariosRepository.save(voluntario);
        return "redirect:/voluntarios";
    }

    @GetMapping("/excluir/{id}")
    public String excluirVoluntario(@PathVariable Long id) {
        voluntariosRepository.deleteById(id);
        return "redirect:/voluntarios";
    }
}
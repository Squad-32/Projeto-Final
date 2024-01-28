package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Cursos;
import mvc.repository.CursosRepository;

@Controller
@RequestMapping("/cursos")
public class cursosController {

    @Autowired
    private CursosRepository cursosRepository;

    @GetMapping("/listar")
    public ModelAndView listarCursos() {
        ModelAndView modelAndView = new ModelAndView("views/cursos/listar");
        modelAndView.addObject("cursos", cursosRepository.findAll());
        return modelAndView;
    }

    @GetMapping("/cadastrar")
    public ModelAndView cadastrarForm() {
        ModelAndView modelAndView = new ModelAndView("views/cursos/cadastrar");
        modelAndView.addObject("curso", new Cursos());
        return modelAndView;
    }

    @PostMapping("/cadastrar")
    public String cadastrarCurso(Cursos curso) {
        cursosRepository.save(curso);
        return "redirect:/cursos/listar";
    }

    @GetMapping("/editar/{id}")
    public ModelAndView editarCurso(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/cursos/editar");
        Cursos curso = cursosRepository.findById(id).orElse(null);
        modelAndView.addObject("curso", curso);
        return modelAndView;
    }

    @PostMapping("/atualizar/{id}")
    public String atualizarCurso(@PathVariable Long id, Cursos curso) {
        curso.setId(id);
        cursosRepository.save(curso);
        return "redirect:/cursos/listar";
    }

    @GetMapping("/deletar/{id}")
    public String deletarCurso(@PathVariable Long id) {
        cursosRepository.deleteById(id);
        return "redirect:/cursos/listar";
    }
}
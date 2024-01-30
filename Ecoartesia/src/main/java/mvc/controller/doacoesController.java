package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Doacoes;
import mvc.repository.DoacoesRepository;

@Controller
@RequestMapping("/doacoes")
public class doacoesController {

    @Autowired
    private DoacoesRepository doacoesRepository;

    @GetMapping
    public ModelAndView listarDoacoes() {
        ModelAndView modelAndView = new ModelAndView("views/doacoes/index");
        modelAndView.addObject("doacoes", doacoesRepository.findAll());
        return modelAndView;
    }

    @GetMapping("/cadastrar")
    public String cadastrarForm() {
        return "views/doacoes/cadastrar";
    }

    @PostMapping("/cadastrar")
    public String cadastrarDoacao(Doacoes doacao) {
        doacoesRepository.save(doacao);
        return "redirect:/doacoes";
    }

    @GetMapping("/editar/{id}")
    public ModelAndView editarDoacao(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/doacoes/editar");
        Doacoes doacao = doacoesRepository.findById(id).orElse(null);
        modelAndView.addObject("doacao", doacao);
        return modelAndView;
    }

    @PostMapping("/atualizar/{id}")
    public String atualizarDoacao(@PathVariable Long id_doacao, Doacoes doacao) {
        doacao.setId_doacao(id_doacao);
        doacoesRepository.save(doacao);
        return "redirect:/doacoes";
    }

    @GetMapping("/deletar/{id}")
    public String deletarDoacao(@PathVariable Long id) {
        doacoesRepository.deleteById(id);
        return "redirect:/doacoes";
    }
}
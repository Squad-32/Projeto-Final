package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Visualizacoes;
import mvc.repository.VisualizacoesRepository;

@Controller
@RequestMapping("/visualizacoes")
public class visualizacoesController {

    @Autowired
    private VisualizacoesRepository visualizacoesRepository;

    @GetMapping
    public ModelAndView listarVisualizacoes() {
        ModelAndView modelAndView = new ModelAndView("views/visualizacoes/index.html");
        modelAndView.addObject("visualizacoes", visualizacoesRepository.findAll());
        return modelAndView;
    }

    @GetMapping("/cadastrar")
    public ModelAndView formNovaVisualizacao() {
        ModelAndView modelAndView = new ModelAndView("views/visualizacoes/cadastrar");
        modelAndView.addObject("visualizacao", new Visualizacoes());
        return modelAndView;
    }

    @PostMapping("/cadastrar")
    public String cadastrarVisualizacao(Visualizacoes visualizacao) {
        visualizacoesRepository.save(visualizacao);
        return "redirect:/visualizacoes";
    }

    @GetMapping("/editar/{id}")
    public ModelAndView formEditarVisualizacao(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/visualizacoes/editar");
        Visualizacoes visualizacao = visualizacoesRepository.findById(id).orElse(null);
        modelAndView.addObject("visualizacao", visualizacao);
        return modelAndView;
    }

    @PostMapping("/atualizar/{id}")
    public String atualizarVisualizacao(@PathVariable Long id, Visualizacoes visualizacao) {
        visualizacao.setId(id);
        visualizacoesRepository.save(visualizacao);
        return "redirect:/visualizacoes";
    }

    @GetMapping("/deletar/{id}")
    public String deletarVisualizacao(@PathVariable Long id) {
        visualizacoesRepository.deleteById(id);
        return "redirect:/visualizacoes";
    }
}
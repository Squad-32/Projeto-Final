package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Organizacoes;
import mvc.repository.OrganizacoesRepository;

@Controller
@RequestMapping("/organizacoes")
public class organizacoesController {

    @Autowired
    private OrganizacoesRepository organizacoesRepository;

    @GetMapping
    public ModelAndView listarOrganizacoes() {
        ModelAndView modelAndView = new ModelAndView("views/organizacoes/index");
        modelAndView.addObject("organizacoes", organizacoesRepository.findAll());
        return modelAndView;
    }

    @GetMapping("/cadastrar")
    public String exibirFormularioCadastro() {
        return "views/organizacoes/cadastrar";
    }

    @PostMapping("/cadastrar")
    public String cadastrarOrganizacao(Organizacoes organizacao) {
        organizacoesRepository.save(organizacao);
        return "redirect:/organizacoes";
    }

    @GetMapping("/editar/{id}")
    public ModelAndView exibirFormularioEdicao(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/organizacoes/editar");
        Organizacoes organizacao = organizacoesRepository.findById(id).orElse(null);
        modelAndView.addObject("organizacao", organizacao);
        return modelAndView;
    }

    @PostMapping("/atualizar/{id}")
    public String atualizarOrganizacao(@PathVariable Long id_organizacao, Organizacoes organizacao) {
        organizacao.setId_organizacao(id_organizacao);
        organizacoesRepository.save(organizacao);
        return "redirect:/organizacoes";
    }

    @GetMapping("/deletar/{id}")
    public String deletarOrganizacao(@PathVariable Long id) {
        organizacoesRepository.deleteById(id);
        return "redirect:/organizacoes";
    }
}
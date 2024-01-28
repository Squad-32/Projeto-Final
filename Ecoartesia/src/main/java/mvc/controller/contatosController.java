package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Contatos;
import mvc.repository.ContatosRepository;

@Controller
@RequestMapping("/contatos")
public class contatosController {

    @Autowired
    private ContatosRepository contatosRepository;

    // Listar todos os contatos
    @GetMapping
    public ModelAndView listarContatos() {
        ModelAndView modelAndView = new ModelAndView("views/contatos/index.html");
        modelAndView.addObject("contatos", contatosRepository.findAll());
        return modelAndView;
    }

    // Mostrar formulário de novo contato
    @GetMapping("/novo")
    public ModelAndView novoContato() {
        ModelAndView modelAndView = new ModelAndView("views/contatos/form.html");
        modelAndView.addObject("contato", new Contatos());
        return modelAndView;
    }

    // Cadastrar novo contato
    @PostMapping("/cadastrar")
    public String cadastrarContato(Contatos contato) {
        contatosRepository.save(contato);
        return "redirect:/contatos";
    }

    // Mostrar formulário de edição de contato
    @GetMapping("/editar/{id}")
    public ModelAndView editarContato(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/contatos/form.html");
        Contatos contato = contatosRepository.findById(id).orElse(null);
        modelAndView.addObject("contato", contato);
        return modelAndView;
    }

    // Atualizar contato
    @PostMapping("/atualizar/{id}")
    public String atualizarContato(@PathVariable Long id, Contatos contato) {
        contato.setId(id);
        contatosRepository.save(contato);
        return "redirect:/contatos";
    }

    // Deletar contato
    @DeleteMapping("/deletar/{id}")
    public String deletarContato(@PathVariable Long id) {
        contatosRepository.deleteById(id);
        return "redirect:/contatos";
    }
}

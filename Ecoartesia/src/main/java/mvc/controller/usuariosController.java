package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Usuarios;
import mvc.repository.UsuariosRepository;

@Controller
@RequestMapping("/usuarios")
public class usuariosController {

    @Autowired
    private UsuariosRepository usuariosRepository;

    @GetMapping
    public ModelAndView listarUsuarios() {
        ModelAndView modelAndView = new ModelAndView("views/usuarios/index");
        modelAndView.addObject("usuarios", usuariosRepository.findAll());
        return modelAndView;
    }

    @GetMapping("/novo")
    public ModelAndView novoUsuario() {
        ModelAndView modelAndView = new ModelAndView("views/usuarios/form");
        modelAndView.addObject("usuario", new Usuarios());
        return modelAndView;
    }

    @PostMapping("/salvar")
    public String salvarUsuario(Usuarios usuario) {
        usuariosRepository.save(usuario);
        return "redirect:/usuarios";
    }

    @GetMapping("/editar/{id}")
    public ModelAndView editarUsuario(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/usuarios/form");
        Usuarios usuario = usuariosRepository.findById(id).orElse(null);
        modelAndView.addObject("usuario", usuario);
        return modelAndView;
    }

    @PostMapping("/atualizar/{id}")
    public String atualizarUsuario(@PathVariable Long id_usuario, Usuarios usuario) {
        usuario.setId_usuario(id_usuario);
        usuariosRepository.save(usuario);
        return "redirect:/usuarios";
    }

    @GetMapping("/excluir/{id}")
    public String excluirUsuario(@PathVariable Long id) {
        usuariosRepository.deleteById(id);
        return "redirect:/usuarios";
    }
}
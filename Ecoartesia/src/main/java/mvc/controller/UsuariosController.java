package mvc.controller;
import java.util.Optional;

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
public class UsuariosController {

	@Autowired
	private UsuariosRepository usuarioRepository;
	
	@GetMapping
	public ModelAndView  usuario() {
		ModelAndView modelAndView = new ModelAndView("views/usuarios/index.html");
		modelAndView.addObject("usuarios", usuarioRepository.findAll());
		modelAndView.addObject("usuario", new Usuarios()); 
		
		return modelAndView;
	}
	
	@PostMapping("/cadastrar")
	public String cadastrar(Usuarios usuario) {
		usuarioRepository.save(usuario);

		return "redirect:/usuarios";
	}
	
	 @PostMapping("/atualizar")
	    public String atualizar(Usuarios usuario) {
	        // Verifique se o usuário existe no banco de dados
	        Optional<Usuarios> usuarioExistente = usuarioRepository.findById(usuario.getId_usuario());

	        if (usuarioExistente.isPresent()) {
	            // Atualize os atributos do usuário existente com os valores do formulário
	            Usuarios usuarioAtualizado = usuarioExistente.get();
	            usuarioAtualizado.setNome(usuario.getNome());
	            usuarioAtualizado.setEmail(usuario.getEmail());
	            usuarioAtualizado.setTelefone(usuario.getTelefone());
	            usuarioAtualizado.setSenha(usuario.getSenha());

	            // Salve o usuário atualizado no banco de dados
	            usuarioRepository.save(usuarioAtualizado);
	        } else {
	            return "redirect:/usuarios";
	        }

	        return "redirect:/usuarios";
	    }
	
	@GetMapping("/{id}/excluir")
	public String excluir(@PathVariable Long id) {
		usuarioRepository.deleteById(id);

		return "redirect:/usuarios";
	}
}
package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import mvc.model.Videos;
import mvc.repository.VideosRepository;

@Controller
@RequestMapping("/videos")
public class videosController {

    @Autowired
    private VideosRepository videosRepository;

    @GetMapping
    public ModelAndView listarVideos() {
        ModelAndView modelAndView = new ModelAndView("views/videos/index.html");
        modelAndView.addObject("videos", videosRepository.findAll());
        return modelAndView;
    }

    @PostMapping("/cadastrar")
    public String cadastrarVideo(Videos video) {
        videosRepository.save(video);
        return "redirect:/videos";
    }

    @GetMapping("/editar/{id}")
    public ModelAndView editarVideo(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/videos/editar");
        Videos video = videosRepository.findById(id).orElse(null);
        modelAndView.addObject("video", video);
        return modelAndView;
    }

    @PostMapping("/atualizar/{id}")
    public String atualizarVideo(@PathVariable Long id, Videos video) {
        video.setId(id);
        videosRepository.save(video);
        return "redirect:/videos";
    }

    @GetMapping("/deletar/{id}")
    public String deletarVideo(@PathVariable Long id) {
        videosRepository.deleteById(id);
        return "redirect:/videos";
    }
}
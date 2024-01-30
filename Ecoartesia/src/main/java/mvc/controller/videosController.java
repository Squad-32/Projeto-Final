package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import mvc.dto.videoDTO;
import mvc.model.Videos;
import mvc.repository.VideosRepository;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/videos")
public class videosController {

    @Autowired
    private VideosRepository videosRepository;

    // List videos in a traditional MVC style
    @GetMapping
    public ModelAndView listarVideos() {
        ModelAndView modelAndView = new ModelAndView("views/videos/index");
        modelAndView.addObject("videos", videosRepository.findAll());
        return modelAndView;
    }

    // List videos as JSON
    @GetMapping("/listar")
    public ResponseEntity<List<videoDTO>> listarVideosJson() {
        List<videoDTO> videoDTOs = videosRepository.findAll().stream()
                .map(video -> new videoDTO(video.getId_video(), video.getTitulo(), video.getCaminho_arquivo(), video.getDuracao()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(videoDTOs);
    }

    // Register a new video
    @PostMapping("/cadastrar")
    public String cadastrarVideo(@Validated Videos video) {
        videosRepository.save(video);
        return "redirect:/videos";
    }

    // Edit a video
    @GetMapping("/editar/{id}")
    public ModelAndView editarVideo(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("views/videos/editar");
        Videos video = videosRepository.findById(id).orElse(null); // Consider adding error handling here
        modelAndView.addObject("video", video);
        return modelAndView;
    }

    // Update a video
    @PostMapping("/atualizar/{id}")
    public String atualizarVideo(@PathVariable Long id_video, @Validated Videos video) {
        video.setId_video(id_video);
        videosRepository.save(video);
        return "redirect:/videos";
    }

    // Delete a video
    @GetMapping("/deletar/{id}")
    public String deletarVideo(@PathVariable Long id) {
        videosRepository.deleteById(id);
        return "redirect:/videos";
    }
}
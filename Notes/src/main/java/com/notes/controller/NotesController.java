package com.notes.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.notes.model.Note;
import com.notes.repository.NotesRepository;

@Controller
@RequestMapping("/notes")
public class NotesController {
	
	
//	//@RequestMapping(value="/login", method = RequestMethod.GET)
//	@GetMapping("/")
//	public String test(ModelMap map)
//	{
//		return "login";
//	}
	
	
	
	@Autowired
    private NotesRepository noteRepository;

	@GetMapping("/")
	public String getAllNotes(Model model) {
	    List<Note> notes = noteRepository.findAll();
	    System.out.println(notes.toString());
	    model.addAttribute("notes", notes);
	    return "notes";
	}


    @GetMapping("/add")
    public String addNoteForm() {
        return "add-note";
    }

    @PostMapping("/add")
    public String addNote(@RequestParam String title, @RequestParam String content) {
        if (title.isEmpty() || content.isEmpty()) {
            return "redirect:/notes/add?error=true";
        }
        Note note = new Note();
        note.setTitle(title);
        note.setContent(content);
        noteRepository.save(note);
        return "redirect:/notes/";
    }

    @GetMapping("/edit/{id}")
    public String editNoteForm(@PathVariable Long id, Model model) {
        Note note = noteRepository.findById(id).orElse(null);
        model.addAttribute("note", note);
        return "edit-note";
    }

    @PostMapping("/edit/{id}")
    public String editNote(@PathVariable Long id, @RequestParam String title, @RequestParam String content) {
        Note note = noteRepository.findById(id).orElse(null);
        if (note != null) {
            note.setTitle(title);
            note.setContent(content);
            noteRepository.save(note);
        }
        return "redirect:/notes/";
    }

    @GetMapping("/delete/{id}")
    public String deleteNote(@PathVariable Long id) {
        noteRepository.deleteById(id);
        return "redirect:/notes/";
    }
}

package com.notes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.notes.model.Note;

@Repository
public interface NotesRepository extends JpaRepository<Note, Long> {

}

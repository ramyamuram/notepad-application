package com.notes.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
	public class Note {

	    @Id
	    @GeneratedValue(strategy = GenerationType.SEQUENCE)
	    private Long id;

	    private String title;
        
	    @Column(length = 10000) 
	    private String content;

		public Note() {
			super();
		}

		public Note(Long id, String title, String content) {
			super();
			this.id = id;
			this.title = title;
			this.content = content;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		@Override
		public String toString() {
			return "Note [id=" + id + ", title=" + title + ", content=" + content + "]";
		}
	    
	    
	    

	    
	}



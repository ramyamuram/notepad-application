<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.notes.model.Note" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notes</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(0deg, transparent 0%, transparent 60%,rgba(183, 183, 183,0.05) 60%, rgba(183, 183, 183,0.05) 93%,transparent 93%, transparent 100%),linear-gradient(135deg, transparent 0%, transparent 55%,rgba(183, 183, 183,0.05) 55%, rgba(183, 183, 183,0.05) 84%,transparent 84%, transparent 100%),linear-gradient(0deg, transparent 0%, transparent 80%,rgba(183, 183, 183,0.05) 80%, rgba(183, 183, 183,0.05) 94%,transparent 94%, transparent 100%),linear-gradient(90deg, rgb(0,0,0),rgb(0,0,0));
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-top: 0;
            padding-top: 20px;
            color:white;
        }

        /* Note Styles */
        .note-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .note {
            background-color: #d6d674;
            border: 1px solid #fbfbfb;
            border-radius: 15px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 4px -1px 20px 0px rgb(255 255 255);
            width: calc(50% - 20px); /* Change width here */
            height: 200px; /* Change height here */
            box-sizing: border-box;
            position: relative; /* To position buttons within the note container */
        }

        .note h2 {
            margin-top: 0;
            color: #333;
        }

        .note p {
            margin-bottom: 0;
            color: #666;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        /* Note Buttons */
        .note-buttons {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            align-items: center;
        }

        .note-buttons a {
            margin-left: 5px;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
            text-decoration: none;
            color: white;
        }

        .note-buttons a.edit {
            background-color: #007bff;
        }

        .note-buttons a.delete {
            background-color: #d6d674;
        }

        .note-buttons a:hover {
            filter: brightness(90%);
        }

         /* Add Note Link */
        .add-note-link {
            display: block;
            text-align: center;
            margin-bottom: 20px;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            border: 2px solid #007bff;
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
        }

        .add-note-link:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Note App</h1>

        <!-- Add Note Link -->
        <a href="/notes/add" class="add-note-link">Add Note</a>

        <!-- Note Container -->
        <div class="note-container">
            <!-- Iterate over each note and display them using scriptlets -->
            <%
                List<Note> notesList = (List<Note>) request.getAttribute("notes");
                if (notesList != null) {
                    for (Note note : notesList) {
            %>
            <div class="note">
                <div class="note-buttons">
                    <a href="/notes/edit/<%= note.getId() %>" class="edit"> 🖊</a>
                    <a href="/notes/delete/<%= note.getId() %>" class="delete">❌</a>
                </div>
                <h2><%= note.getTitle() %></h2>
                <p><%= note.getContent() %></p>
                <!-- Optionally, you can display note ID or other information here -->
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>

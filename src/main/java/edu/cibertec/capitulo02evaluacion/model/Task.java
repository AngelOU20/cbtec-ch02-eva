package edu.cibertec.capitulo02evaluacion.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Task {
    private int id;

    @NotNull
    @NotBlank
    @Size(min = 3, max = 100)
    private String title;

    private String description;
    private String status;

    public Task() {
    }

    public Task(int id, String title, String description, String status) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

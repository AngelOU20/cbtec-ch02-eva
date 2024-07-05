package edu.cibertec.capitulo02evaluacion.service.task;

import edu.cibertec.capitulo02evaluacion.model.Task;

import java.util.List;

public interface ITaskService {
    List<Task> getAll();
    void save(Task task);
    Task getTaskById(int id);
    void updateTask(Task task);
    void delete(Task task);
}

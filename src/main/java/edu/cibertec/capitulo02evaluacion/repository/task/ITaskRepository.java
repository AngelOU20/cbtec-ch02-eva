package edu.cibertec.capitulo02evaluacion.repository.task;

import edu.cibertec.capitulo02evaluacion.model.Task;

import java.util.List;

public interface ITaskRepository {
    List<Task> getTasks();
    void saveTask(Task task);
    Task getTaskById(int id);
    void updateTask(Task task);
    void deleteTask(Task task);
}

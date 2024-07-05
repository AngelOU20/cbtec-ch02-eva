package edu.cibertec.capitulo02evaluacion.service.task;

import edu.cibertec.capitulo02evaluacion.model.Task;
import edu.cibertec.capitulo02evaluacion.repository.task.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService implements ITaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Override
    public List<Task> getAll() {
        return taskRepository.getTasks();
    }

    @Override
    public void save(Task task) {
        taskRepository.saveTask(task);
    }

    @Override
    public Task getTaskById(int id) {
        return taskRepository.getTaskById(id);
    }

    @Override
    public void updateTask(Task task) {
        taskRepository.updateTask(task);
    }

    @Override
    public void delete(Task task) {
        taskRepository.deleteTask(task);
    }

}

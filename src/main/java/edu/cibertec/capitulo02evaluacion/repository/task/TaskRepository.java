package edu.cibertec.capitulo02evaluacion.repository.task;

import edu.cibertec.capitulo02evaluacion.model.Task;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Repository
public class TaskRepository implements ITaskRepository {
    private List<Task> tasks;
    private AtomicInteger idCounter;

    public TaskRepository() {
        tasks = new ArrayList<>();
        idCounter = new AtomicInteger();
        tasks.add(new Task(idCounter.incrementAndGet(),
                "Estudiar programación",
                "Empezar a estudiar Java a las 4 pm hasta las 8 pm",
                "Pendiente"));
        tasks.add(new Task(idCounter.incrementAndGet(),
                "Hacer ejercicio",
                "Ir al gimnasio y hacer entrenamiento de fuerza de 6 am a 7 am",
                "En progreso"));
        tasks.add(new Task(idCounter.incrementAndGet(),
                "Leer un libro",
                "Leer 50 páginas del libro 'Clean Code' de 9 pm a 10:30 pm",
                "Completada"));
        tasks.add(new Task(idCounter.incrementAndGet(),
                "Preparar la cena",
                "Cocinar una cena saludable para la familia a las 7 pm",
                "Pendiente"));
        tasks.add(new Task(idCounter.incrementAndGet(),
                "Revisar correos",
                "Revisar y responder correos importantes de trabajo de 8 am a 9 am",
                "En progreso"));
    }

    @Override
    public List<Task> getTasks() {
        return tasks;
    }

    @Override
    public void saveTask(Task task) {
        task.setId(idCounter.incrementAndGet());
        tasks.add(task);
    }

    @Override
    public Task getTaskById(int id) {
        return tasks.stream().filter(task -> task.getId() == id)
                .findFirst().orElse(null);
    }

    @Override
    public void updateTask(Task task) {
        Task existingTask = getTaskById(task.getId());
        if (existingTask != null) {
            existingTask.setTitle(task.getTitle());
            existingTask.setDescription(task.getDescription());
            existingTask.setStatus(task.getStatus());
        }
    }

    @Override
    public void deleteTask(Task task) {
        tasks.removeIf(t -> t.getId() == task.getId());
    }
}

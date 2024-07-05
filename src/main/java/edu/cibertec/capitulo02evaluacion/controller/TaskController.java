package edu.cibertec.capitulo02evaluacion.controller;

import edu.cibertec.capitulo02evaluacion.model.Task;
import edu.cibertec.capitulo02evaluacion.service.task.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
public class TaskController {

    @Autowired
    private TaskService taskService;

    @RequestMapping("taskMostrar")
    public ModelAndView taskView() {
        List<Task> tasks = taskService.getAll();
        ModelAndView mv = new ModelAndView("taskLista", "tasks", tasks);
        mv.addObject("taskBean", new Task());
        return mv;
    }

    @RequestMapping("taskCrear")
    public ModelAndView taskSave(@Valid @ModelAttribute("taskBean") Task task, BindingResult result) {
        ModelAndView mv = null;

        if (result.hasErrors()) {
            mv = new ModelAndView("taskLista", "taskBean", task);
            mv.addObject("tasks", taskService.getAll());
        } else {
            taskService.save(task);
            mv = new ModelAndView("taskLista", "tasks", taskService.getAll());
            mv.addObject("taskBean", new Task());
        }

        return mv;
    }

    @RequestMapping("taskEditar")
    public ModelAndView taskEdit(@RequestParam("id") int id) {
        Task task = taskService.getTaskById(id);
        ModelAndView mv = new ModelAndView("taskEditar", "taskBean", task);
        mv.addObject("tasks", taskService.getAll());
        return mv;
    }

    @RequestMapping("taskActualizar")
    public ModelAndView taskUpdate(@Valid @ModelAttribute("taskBean") Task task, BindingResult result) {
        ModelAndView mv;

        if (result.hasErrors()) {
            mv = new ModelAndView("taskEditar", "taskBean", task);
        } else {
            taskService.updateTask(task); // Llamada al servicio para actualizar la tarea
            List<Task> tasks = taskService.getAll();
            mv = new ModelAndView("taskLista", "tasks", tasks);
            mv.addObject("taskBean", new Task());
        }

        return mv;
    }


    @RequestMapping("taskEliminar")
    public ModelAndView taskDelete(@RequestParam("id") int id) {
        Task task = new Task();
        task.setId(id);
        taskService.delete(task);
        ModelAndView mv = new ModelAndView("taskLista", "tasks", taskService.getAll());
        mv.addObject("taskBean", new Task());
        return mv;
    }
}

package edu.cibertec.capitulo02evaluacion.service;

import edu.cibertec.capitulo02evaluacion.model.User;

public interface IUserService {
    User login(String username, String password);
    void register(User user);
}

package edu.cibertec.capitulo02evaluacion.repository;

import edu.cibertec.capitulo02evaluacion.model.User;

public interface IUserRepository {
    User findByUsername(String username);
    void save(User user);
    User validateLogin(String username, String password);
}

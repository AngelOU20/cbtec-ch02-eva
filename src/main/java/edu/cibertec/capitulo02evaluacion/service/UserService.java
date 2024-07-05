package edu.cibertec.capitulo02evaluacion.service;

import edu.cibertec.capitulo02evaluacion.model.User;
import edu.cibertec.capitulo02evaluacion.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements  IUserService{

    @Autowired
    private UserRepository userRepository;


    @Override
    public User login(String username, String password) {
        return userRepository.validateLogin(username, password);
    }

    @Override
    public void register(User user) {
        userRepository.save(user);
    }
}

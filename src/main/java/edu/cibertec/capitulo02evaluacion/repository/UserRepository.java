package edu.cibertec.capitulo02evaluacion.repository;

import edu.cibertec.capitulo02evaluacion.model.User;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserRepository implements IUserRepository {
    private List<User> users = new ArrayList<>();

    public UserRepository() {
        users.add(new User("john", "john@gmail.com", "ard123"));
        users.add(new User("jane", "jane@gmail.com", "ord456"));
    }

    @Override
    public User findByUsername(String username) {
        for (User user: users) {
            if (user.getUsername().equals(username)) {
                return user;
            }
        }
        return null;
    }

    @Override
    public void save(User user) {
        users.add(user);
    }

    @Override
    public User validateLogin(String username, String password) {
        User user = findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}

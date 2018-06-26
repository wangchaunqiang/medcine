package com.example.medcine.repository;

import com.example.medcine.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {

        public User findUserByUsernameAndPassword(String username, String password);

        public User findUserByUsername(String username);
}

package com.example.medcine.repository;

import com.example.medcine.model.Words;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WordsRepository extends JpaRepository<Words,Integer> {
    public List<Words> findAllByWnameIsLike(String seachText);
}

package com.example.medcine.repository;

import com.example.medcine.model.Prescript;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PrescriptRepository extends JpaRepository<Prescript,Integer> {

    public List<Prescript> findAllByPnameIsLike(String seachText);

}


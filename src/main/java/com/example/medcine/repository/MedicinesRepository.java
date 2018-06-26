package com.example.medcine.repository;


import com.example.medcine.model.Medicines;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface MedicinesRepository extends JpaRepository<Medicines,Integer> {
    public List<Medicines> findAllByMnameIsLike(String seachText);
}

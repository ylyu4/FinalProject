package com.example.FinalProject.repository;

import com.example.FinalProject.model.Employer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EmployerRepository extends CrudRepository<Employer, Long> {

    Employer findEmployerByUsername(String username);

    Employer findEmployerByUsernameAndPassword(String username, String password);

    Optional<Employer> findById(Long id);
}

package com.example.FinalProject.repository;

import com.example.FinalProject.model.Administrator;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AdministratorRepository extends CrudRepository<Administrator, Long> {

    Administrator save(Administrator administrator);

    Administrator findAdministratorByUsername(String username);

    Administrator findAdministratorByUsernameAndPassword(String username, String password);
}
